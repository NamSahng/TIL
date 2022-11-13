import aiohttp
import asyncio

urls = [
    "https://imdb.com",    
    "https://python.org",
    "https://docs.python.org",
    "https://wikipedia.org",
]

async def get_from(session, url):
    async with session.get(url) as r:
        return await r.text()


async def main():
    async with aiohttp.ClientSession() as session:
        datas = await asyncio.gather(*[get_from(session, u) for u in urls])
        print ([_[:200] for _ in datas])

if __name__ == "__main__":
    loop = asyncio.get_event_loop()
    loop.run_until_complete(main())