Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51739390D1A
	for <lists+amd-gfx@lfdr.de>; Wed, 26 May 2021 01:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4656E453;
	Tue, 25 May 2021 23:56:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2066.outbound.protection.outlook.com [40.107.102.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E05C6E453
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 May 2021 23:56:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5V8zvFVko+hyDSbDd+H8nB/oSDvgSMJwbiYPh3AvkeYzSnUsdmyGUUY1PIgMQOKQu4Q1W+kstKvWSYghGrJASyLxbh4crJX4JqftpA8chX8+RTOjuUrCnG0CcObTpJszgm1apbjHrgdobdIC0N6yRz1gF9dDdgSwkg0JiNyDZmXEAiFp3VvxZBHIj77qnwGFd6IQIX3Klv3e8uRwi1LbwpjqLtVtxNjgKoiXpmYQQvb35rwFQb74DyXPwZu1W9l8+IZs4UL66WjBbe5ehWi4OhJYcrS670X/JDe0bFR0kKMwpK/fPAsjQGdiX2umQv9LNv3s8T8ZIze6yqfHsLAHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6mcK9bDcxtWTLKII1RUjFKT0EybALM+OWR++yt9t4k=;
 b=h+DIpM+IKNitCsIWgG/8ZDwCtlltz00vKtXtgWVlsaOaOnhUf1qyg9IPKAcjeFYFS+XO7YfSia47bXQTFr+MnJROvSZ5InIoklgqv3J37FhINrWskfVw2owT52qXY32lpVYJNOeYINJyr/eBK3XssKUYDz6pqEslPCtX+GO1nVLKcRfAfuGgw8V62H2fzSCiw+G+8hsxA+98Zh8WmxCf72OjJsZiQK692z0QYvv5FmMbInXlxpKb1Vglv8jSrySgeOJejubmhqMP81+ISZD+urjbl7LtyYtkuWzHGw5MoKbyfBPwCGvZPiDsqRG9zwdU0IDSOnulUz0IEtShcyCRZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6mcK9bDcxtWTLKII1RUjFKT0EybALM+OWR++yt9t4k=;
 b=3muKOc1LfXAagNFwIIkWI9d3LlTJIrq/Ipi0be9BN7czxU4gHqvqAcy2FB91/fu4mdLKYQkJ6P9Bimh3Knb19aINegKslFTR7l/9NpobGVrtTBeSi/r6bAv9AxkyKLnldUtV6k6UakiTKBxCcULdmdqcfLpAYWi6E2Y/1zAJF7o=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB3867.namprd12.prod.outlook.com (2603:10b6:5:1cf::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Tue, 25 May
 2021 23:56:51 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::142:82e3:7e9d:55a0]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::142:82e3:7e9d:55a0%6]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 23:56:51 +0000
Subject: Re: [PATCH 3/3] drm/amdgpu: Use delayed work to collect RAS error
 counters
To: Alex Deucher <alexdeucher@gmail.com>
References: <20210521211836.4839-1-luben.tuikov@amd.com>
 <20210521211836.4839-3-luben.tuikov@amd.com>
 <CADnq5_O8Q1f4GcTcErQnPS-XdOsEF0xpe_+AHQrFVHC6kzMzAg@mail.gmail.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <19e881f0-0d34-c556-8618-4fe2d2f8fef6@amd.com>
Date: Tue, 25 May 2021 19:56:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <CADnq5_O8Q1f4GcTcErQnPS-XdOsEF0xpe_+AHQrFVHC6kzMzAg@mail.gmail.com>
Content-Language: en-CA
X-Originating-IP: [108.162.138.69]
X-ClientProxiedBy: YT1PR01CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::31)
 To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (108.162.138.69) by
 YT1PR01CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.27 via Frontend Transport; Tue, 25 May 2021 23:56:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 719ecda0-06ca-4891-18a2-08d91fd8c3ba
X-MS-TrafficTypeDiagnostic: DM6PR12MB3867:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB386774964C673E7D51347AF399259@DM6PR12MB3867.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GrMdXjH9tPZgeqDhzIIxx0F8nFRwJjZfxGChWuc94uNxIc4Oh8EIj/+DjBSf97kSNO9cfHTi5KrZ1vPbdmlzq23eY34oiil4A9AZLSPH3vchvckCgEpx82xWeE16WDMQ9k6I+xqexz1tWc3rXvt6+qVch7hlKeHRl9b7AxxWeVSN7nFWnk8zZfPSTr2H2KUcoZ/chCfrZXmafiDhMh398xsAp+cdTE+s+dejfFsI9t5dxYt7/S4scWJ0W0FYd670d0bch00QLIBnZeaBrcRy+UBLVdR91auI23DCNXiAjoEiP/Eh6KhWHEtH2p6TdY0YKzcqd/uJ8q3pp5274lHY+peGxnbVWTkVmWoFCMb02chdtu3M8ZIkVYydBnsLjM8bwWetPtgAGViH1hzKpmiLRQOSiXEo5tv7TlB3F1RPpCLYkRdpG96tX5JCONFjRugYdpUF/ZGs3K2dkSCIuSN7CH7nlXrISf+lbxtvKvjMxi/0nyUIULnzW3WHB/LfxGjPNI7OQenSBRBwU/EvzHjoumEjptiUz0EolT1i6fvGkUGPOjqi1165vIM1GqITQ+e3Imht/sKjq+Oq4TcWBXPL+wyZ2c8a2QnKtyWqFCYBVgwF7NAS8Dmnf+AMM06a8wGzcQzf9FKY9/TLw09PtaTTrqnGnntWdZ3RAeUU1mFc/TIQUoERoQfEfSxGKxHZPXuynO2PgMAmfhpddjssDcFB8hnR+9txM8NWJKr4A9g/mLk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(366004)(39850400004)(396003)(186003)(16526019)(36756003)(2616005)(4326008)(6512007)(66476007)(6486002)(66556008)(8936002)(5660300002)(53546011)(44832011)(55236004)(26005)(54906003)(2906002)(478600001)(86362001)(956004)(6506007)(66574015)(966005)(45080400002)(83380400001)(6916009)(31686004)(38100700002)(31696002)(8676002)(316002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QnBjdFZmRjdISFJIdzJ2VGE5MHNGczNLcVR3ZDBHN2ZUaFpKYmNqbENNeXRo?=
 =?utf-8?B?OUNsTmtDZ3ErOEU4VXhFMG1DcVFZYkVYcEE1V1NVRHorejhGeWlkUVZTTm9q?=
 =?utf-8?B?T2xJSFhReEk2S1RJdzhheG9NZDl1NnJLZDlGSXNveStqU2NMOU1YTkhEUUgy?=
 =?utf-8?B?aEJCZmdlQXFUa0xaM2QzaFpBUUpGTTBreWRFRUZaOXVtNGgzN2ZhNWVQR2Nh?=
 =?utf-8?B?SEpRd2xqcW0yQTI5Z2FNdDJDUStWb0xMekZ6TlpvaThsdHF5cVlwQ1dsNURp?=
 =?utf-8?B?RW5qVndTcnZsc1J6MVRpaS9DWnRLbk9YaDFzVHJkbGQ1dW0yaldSdVlRWjl5?=
 =?utf-8?B?V2l3NkRjRWswdmFldVkwaFRNZGdHTUdiNTBGTlBpYWtGTENBZ2FxQlFwbVBo?=
 =?utf-8?B?cGV6b1hnQjJ4MU5lWTdLb1lKOHgra2hWcE0vUkN2U2krTGlPdExUWFBURllh?=
 =?utf-8?B?VTRvZGZ5VVFXcXQyRlhyU2kveEFkd2xyM0lIWDFQVWRvNFd4RUFtY3pjaUdx?=
 =?utf-8?B?NXQ0T3E4L1FKM2pqSUFKVmxuQUZGY2xZb1J4K21JM3lLMnlydDdlZkFqVXBs?=
 =?utf-8?B?a3A1ZFVLNEcrWGoxMXQ0cTQzcitnbHZBaldwVjE2dVVENCsxS01vUjVudUp6?=
 =?utf-8?B?RDJxZlY3SjVxV2xyY0pPdkYwVFNQeHZwSEJzRjVJOHBGZVFxcExJbk5hMU1k?=
 =?utf-8?B?NjNTRTBOUk12YmlZcDU1dVhVWkZOMUhqL2dRa1dZMVl6ODNUckVtSVI3ZURC?=
 =?utf-8?B?TTlOcG90Rk9GdUxpSTNQV2wySkFiMkhNajlWdyt3WERxeElmNnUwSkplZFAv?=
 =?utf-8?B?TEdXdGdZMUlYWHc3NE9zWVM5clFCYnlNS2pwU1paU1AwMVdicGd0SnZvTUR4?=
 =?utf-8?B?a0tTWFVwU2MzZE9BZGNTZW1iVzB2OXpwbnBtQlZjclZoc0F6amFSMUV6bkJw?=
 =?utf-8?B?a01IcUpaZ0g3Zlp1NnNxY0RlWnErM0h4NmRpZGYxMm43U1BaT050eGVZcjZz?=
 =?utf-8?B?NUI5a0NVM21FQXlUdWh3TFZOcGVwcENlUUNZRGpJTmhLcTlxT3ZUOTV3YjVI?=
 =?utf-8?B?MVdSeFZmTE1JNWhyd2szWHZSbnFjeW42SEdQY2xQY1hzQ0puemFqY0hTV2dO?=
 =?utf-8?B?bVZlN2VhdnA4MFVjcmIvekV3ek5mTUVqbHFnaWtNTS81RkFRMDBYKy9zbkk4?=
 =?utf-8?B?bkdXQi9IMEVlV2NweWlmbzJmeHdxWnRXOEpzR3BNY3ZrUWpDT2QxYUYzYkpE?=
 =?utf-8?B?WFNUNm44emZWWk1rOFpUZGsvekpRUnFmNVRaSHhGWU51cVN3OExtcmxuM1FM?=
 =?utf-8?B?V3g1T2Jveld1dVZpMkpPMXRIdCt1amZ3RFF2TUtaZGZ4bHpKRlFmK3hPWW1y?=
 =?utf-8?B?bUVZeEtKUnkwdEgzc0dNb1RqZ1M3YmxoSWpWUmV0cy9EQTcvYTNDUzFuM3FR?=
 =?utf-8?B?UXVyLzJvWXNnMDh1QjNEYm43MGsxVnAxVWdWTTRwejBocmtTZnJqa1JrZTlE?=
 =?utf-8?B?YXRjYzJZRFFDdEZJMDhMMHB0MWVnTlBPZ2ptNmNGTmg0Wlc3OGtLK3hXY2Zi?=
 =?utf-8?B?UjRoUzJhUy9tRkJwMmgycGdua3p3bEE2OWMrNGlWdG1jWW9mVVN5MW4zMGEz?=
 =?utf-8?B?Y2xsRkkrNEVXMUJTYzR6SFFsKzVDQzdpUTBadDZZU1JZNHRJMWlGalNBOTB3?=
 =?utf-8?B?cWtQVnJQclNiY2grZlRVdSt4TWpYRVFnSTg3enY4N21RbVFSQ0IvbmwxU2lq?=
 =?utf-8?Q?zYn8x9wsU9q15Eq+1siY0jmedabMO5STCPblZVc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 719ecda0-06ca-4891-18a2-08d91fd8c3ba
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 23:56:50.9474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3YF9OBVEtLU3Wj8mNyHSu+tF+nn+5sqsMj5uO0/IO2j9Udr5S5203qYM04hTHbnJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3867
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 John Clements <john.clements@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAyMS0wNS0yNSA2OjAzIHAubS4sIEFsZXggRGV1Y2hlciB3cm90ZToKPiBPbiBGcmksIE1h
eSAyMSwgMjAyMSBhdCA1OjE5IFBNIEx1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+
IHdyb3RlOgo+PiBPbiBDb250ZXh0IFF1ZXJ5MiBJT0NUTCByZXR1cm4gdGhlIGNvcnJlY3RhYmxl
IGFuZAo+PiB1bmNvcnJlY3RhYmxlIGVycm9ycyBpbiBPKDEpIGZhc2hpb24sIGZyb20gY2FjaGVk
Cj4+IHZhbHVlcywgYW5kIHNjaGVkdWxlIGEgZGVsYXllZCB3b3JrIGZ1bmN0aW9uIHRvCj4+IGNh
bGN1bGF0ZSBhbmQgY2FjaGUgdGhlbSBmb3IgdGhlIG5leHQgc3VjaCBJT0NUTC4KPiBQYXRjaGVz
IDEsIDIsIGFyZToKPiBSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgo+Cj4gRm9yIHBhdGNoIDMsIEkgdGhpbmsgd2UgbmVlZCB0byBjYW5jZWwgYW55
IG91dHN0YW5kaW5nIGRlbGF5ZWQgd29yayBpbgo+IHJhc19maW5pKCkuICBPdGhlciB0aGFuIHRo
YXQsIGl0IGxvb2tzIGdvb2QgdG8gbWUuCkFoLCB5ZXMsIGdvb2QgcG9pbnQtLUkgbWlzc2VkIHRo
YXQuIEknbGwgYWRkIGl0IGFuZCByZXN1Ym1pdC4KClJlZ2FyZHMsCkx1YmVuCgo+Cj4gQWxleAo+
Cj4+IENjOiBBbGV4YW5kZXIgRGV1Y2hlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT4KPj4g
Q2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4gQ2M6IEpv
aG4gQ2xlbWVudHMgPGpvaG4uY2xlbWVudHNAYW1kLmNvbT4KPj4gQ2M6IEhhd2tpbmcgWmhhbmcg
PEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogTHViZW4gVHVpa292IDxs
dWJlbi50dWlrb3ZAYW1kLmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfY3R4LmMgfCAzMiArKysrKysrKysrKysrKysrKysrLS0KPj4gIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysr
KysKPj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCB8ICA1ICsrKysK
Pj4gIDMgZmlsZXMgY2hhbmdlZCwgNzMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguYwo+PiBpbmRleCBiYjBjZmU4
NzFhYmEuLjRlOTVkMjU1OTYwYiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2N0eC5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9jdHguYwo+PiBAQCAtMzMxLDEwICszMzEsMTMgQEAgc3RhdGljIGludCBhbWRncHVfY3R4
X3F1ZXJ5KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+PiAgICAgICAgIHJldHVybiAwOwo+
PiAgfQo+Pgo+PiArI2RlZmluZSBBTURHUFVfUkFTX0NPVU5URV9ERUxBWV9NUyAzMDAwCj4+ICsK
Pj4gIHN0YXRpYyBpbnQgYW1kZ3B1X2N0eF9xdWVyeTIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsCj4+IC0gICAgICAgc3RydWN0IGFtZGdwdV9mcHJpdiAqZnByaXYsIHVpbnQzMl90IGlkLAo+
PiAtICAgICAgIHVuaW9uIGRybV9hbWRncHVfY3R4X291dCAqb3V0KQo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCBhbWRncHVfZnByaXYgKmZwcml2LCB1aW50MzJfdCBpZCwK
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bmlvbiBkcm1fYW1kZ3B1X2N0eF9vdXQg
Km91dCkKPj4gIHsKPj4gKyAgICAgICBzdHJ1Y3QgYW1kZ3B1X3JhcyAqY29uID0gYW1kZ3B1X3Jh
c19nZXRfY29udGV4dChhZGV2KTsKPj4gICAgICAgICBzdHJ1Y3QgYW1kZ3B1X2N0eCAqY3R4Owo+
PiAgICAgICAgIHN0cnVjdCBhbWRncHVfY3R4X21nciAqbWdyOwo+Pgo+PiBAQCAtMzYxLDYgKzM2
NCwzMSBAQCBzdGF0aWMgaW50IGFtZGdwdV9jdHhfcXVlcnkyKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LAo+PiAgICAgICAgIGlmIChhdG9taWNfcmVhZCgmY3R4LT5ndWlsdHkpKQo+PiAgICAg
ICAgICAgICAgICAgb3V0LT5zdGF0ZS5mbGFncyB8PSBBTURHUFVfQ1RYX1FVRVJZMl9GTEFHU19H
VUlMVFk7Cj4+Cj4+ICsgICAgICAgaWYgKGFkZXYtPnJhc19lbmFibGVkICYmIGNvbikgewo+PiAr
ICAgICAgICAgICAgICAgLyogUmV0dXJuIHRoZSBjYWNoZWQgdmFsdWVzIGluIE8oMSksCj4+ICsg
ICAgICAgICAgICAgICAgKiBhbmQgc2NoZWR1bGUgZGVsYXllZCB3b3JrIHRvIGNhY2hlCj4+ICsg
ICAgICAgICAgICAgICAgKiBuZXcgdmF1ZXMuCj4+ICsgICAgICAgICAgICAgICAgKi8KPj4gKyAg
ICAgICAgICAgICAgIGludCBjZV9jb3VudCwgdWVfY291bnQ7Cj4+ICsKPj4gKyAgICAgICAgICAg
ICAgIGNlX2NvdW50ID0gYXRvbWljX3JlYWQoJmNvbi0+cmFzX2NlX2NvdW50KTsKPj4gKyAgICAg
ICAgICAgICAgIHVlX2NvdW50ID0gYXRvbWljX3JlYWQoJmNvbi0+cmFzX3VlX2NvdW50KTsKPj4g
Kwo+PiArICAgICAgICAgICAgICAgaWYgKGNlX2NvdW50ICE9IGN0eC0+cmFzX2NvdW50ZXJfY2Up
IHsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgY3R4LT5yYXNfY291bnRlcl9jZSA9IGNlX2Nv
dW50Owo+PiArICAgICAgICAgICAgICAgICAgICAgICBvdXQtPnN0YXRlLmZsYWdzIHw9IEFNREdQ
VV9DVFhfUVVFUlkyX0ZMQUdTX1JBU19DRTsKPj4gKyAgICAgICAgICAgICAgIH0KPj4gKwo+PiAr
ICAgICAgICAgICAgICAgaWYgKHVlX2NvdW50ICE9IGN0eC0+cmFzX2NvdW50ZXJfdWUpIHsKPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgY3R4LT5yYXNfY291bnRlcl91ZSA9IHVlX2NvdW50Owo+
PiArICAgICAgICAgICAgICAgICAgICAgICBvdXQtPnN0YXRlLmZsYWdzIHw9IEFNREdQVV9DVFhf
UVVFUlkyX0ZMQUdTX1JBU19VRTsKPj4gKyAgICAgICAgICAgICAgIH0KPj4gKwo+PiArICAgICAg
ICAgICAgICAgaWYgKCFkZWxheWVkX3dvcmtfcGVuZGluZygmY29uLT5yYXNfY291bnRlX2RlbGF5
X3dvcmspKQo+PiArICAgICAgICAgICAgICAgICAgICAgICBzY2hlZHVsZV9kZWxheWVkX3dvcmso
JmNvbi0+cmFzX2NvdW50ZV9kZWxheV93b3JrLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbXNlY3NfdG9famlmZmllcyhBTURHUFVfUkFTX0NPVU5URV9ERUxBWV9NUykpOwo+
PiArICAgICAgIH0KPj4gKwo+PiAgICAgICAgIG11dGV4X3VubG9jaygmbWdyLT5sb2NrKTsKPj4g
ICAgICAgICByZXR1cm4gMDsKPj4gIH0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9yYXMuYwo+PiBpbmRleCBlZDNjNDNlOGIwYjUuLjgwZjU3NjA5ODMxOCAxMDA2NDQKPj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwo+PiBAQCAtMjcsNiArMjcsNyBAQAo+
PiAgI2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KPj4gICNpbmNsdWRlIDxsaW51eC9yZWJvb3Qu
aD4KPj4gICNpbmNsdWRlIDxsaW51eC9zeXNjYWxscy5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L3Bt
X3J1bnRpbWUuaD4KPj4KPj4gICNpbmNsdWRlICJhbWRncHUuaCIKPj4gICNpbmNsdWRlICJhbWRn
cHVfcmFzLmgiCj4+IEBAIC0yMTE2LDYgKzIxMTcsMzAgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X3Jh
c19jaGVja19zdXBwb3J0ZWQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4+ICAgICAgICAg
ICAgICAgICBhZGV2LT5yYXNfaHdfZW5hYmxlZCAmIGFtZGdwdV9yYXNfbWFzazsKPj4gIH0KPj4K
Pj4gK3N0YXRpYyB2b2lkIGFtZGdwdV9yYXNfY291bnRlX2R3KHN0cnVjdCB3b3JrX3N0cnVjdCAq
d29yaykKPj4gK3sKPj4gKyAgICAgICBzdHJ1Y3QgYW1kZ3B1X3JhcyAqY29uID0gY29udGFpbmVy
X29mKHdvcmssIHN0cnVjdCBhbWRncHVfcmFzLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmFzX2NvdW50ZV9kZWxheV93b3JrLndvcmspOwo+PiArICAg
ICAgIHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gY29uLT5hZGV2Owo+PiArICAgICAgIHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYgPSAmYWRldi0+ZGRldjsKPj4gKyAgICAgICB1bnNpZ25lZCBs
b25nIGNlX2NvdW50LCB1ZV9jb3VudDsKPj4gKyAgICAgICBpbnQgcmVzOwo+PiArCj4+ICsgICAg
ICAgcmVzID0gcG1fcnVudGltZV9nZXRfc3luYyhkZXYtPmRldik7Cj4+ICsgICAgICAgaWYgKHJl
cyA8IDApCj4+ICsgICAgICAgICAgICAgICBnb3RvIE91dDsKPj4gKwo+PiArICAgICAgIC8qIENh
Y2hlIG5ldyB2YWx1ZXMuCj4+ICsgICAgICAgICovCj4+ICsgICAgICAgYW1kZ3B1X3Jhc19xdWVy
eV9lcnJvcl9jb3VudChhZGV2LCAmY2VfY291bnQsICZ1ZV9jb3VudCk7Cj4+ICsgICAgICAgYXRv
bWljX3NldCgmY29uLT5yYXNfY2VfY291bnQsIGNlX2NvdW50KTsKPj4gKyAgICAgICBhdG9taWNf
c2V0KCZjb24tPnJhc191ZV9jb3VudCwgdWVfY291bnQpOwo+PiArCj4+ICsgICAgICAgcG1fcnVu
dGltZV9tYXJrX2xhc3RfYnVzeShkZXYtPmRldik7Cj4+ICtPdXQ6Cj4+ICsgICAgICAgcG1fcnVu
dGltZV9wdXRfYXV0b3N1c3BlbmQoZGV2LT5kZXYpOwo+PiArfQo+PiArCj4+ICBpbnQgYW1kZ3B1
X3Jhc19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+PiAgewo+PiAgICAgICAgIHN0
cnVjdCBhbWRncHVfcmFzICpjb24gPSBhbWRncHVfcmFzX2dldF9jb250ZXh0KGFkZXYpOwo+PiBA
QCAtMjEzMCw2ICsyMTU1LDExIEBAIGludCBhbWRncHVfcmFzX2luaXQoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpCj4+ICAgICAgICAgaWYgKCFjb24pCj4+ICAgICAgICAgICAgICAgICByZXR1
cm4gLUVOT01FTTsKPj4KPj4gKyAgICAgICBjb24tPmFkZXYgPSBhZGV2Owo+PiArICAgICAgIElO
SVRfREVMQVlFRF9XT1JLKCZjb24tPnJhc19jb3VudGVfZGVsYXlfd29yaywgYW1kZ3B1X3Jhc19j
b3VudGVfZHcpOwo+PiArICAgICAgIGF0b21pY19zZXQoJmNvbi0+cmFzX2NlX2NvdW50LCAwKTsK
Pj4gKyAgICAgICBhdG9taWNfc2V0KCZjb24tPnJhc191ZV9jb3VudCwgMCk7Cj4+ICsKPj4gICAg
ICAgICBjb24tPm9ianMgPSAoc3RydWN0IHJhc19tYW5hZ2VyICopKGNvbiArIDEpOwo+Pgo+PiAg
ICAgICAgIGFtZGdwdV9yYXNfc2V0X2NvbnRleHQoYWRldiwgY29uKTsKPj4gQEAgLTIyMzMsNiAr
MjI2Myw4IEBAIGludCBhbWRncHVfcmFzX2xhdGVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCByYXNfZnNfaWYgKmZzX2lu
Zm8sCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcmFzX2loX2lmICppaF9pbmZv
KQo+PiAgewo+PiArICAgICAgIHN0cnVjdCBhbWRncHVfcmFzICpjb24gPSBhbWRncHVfcmFzX2dl
dF9jb250ZXh0KGFkZXYpOwo+PiArICAgICAgIHVuc2lnbmVkIGxvbmcgdWVfY291bnQsIGNlX2Nv
dW50Owo+PiAgICAgICAgIGludCByOwo+Pgo+PiAgICAgICAgIC8qIGRpc2FibGUgUkFTIGZlYXR1
cmUgcGVyIElQIGJsb2NrIGlmIGl0IGlzIG5vdCBzdXBwb3J0ZWQgKi8KPj4gQEAgLTIyNzMsNiAr
MjMwNSwxMiBAQCBpbnQgYW1kZ3B1X3Jhc19sYXRlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCj4+ICAgICAgICAgaWYgKHIpCj4+ICAgICAgICAgICAgICAgICBnb3RvIHN5c2ZzOwo+
Pgo+PiArICAgICAgIC8qIFRob3NlIGFyZSB0aGUgY2FjaGVkIHZhbHVlcyBhdCBpbml0Lgo+PiAr
ICAgICAgICAqLwo+PiArICAgICAgIGFtZGdwdV9yYXNfcXVlcnlfZXJyb3JfY291bnQoYWRldiwg
JmNlX2NvdW50LCAmdWVfY291bnQpOwo+PiArICAgICAgIGF0b21pY19zZXQoJmNvbi0+cmFzX2Nl
X2NvdW50LCBjZV9jb3VudCk7Cj4+ICsgICAgICAgYXRvbWljX3NldCgmY29uLT5yYXNfdWVfY291
bnQsIHVlX2NvdW50KTsKPj4gKwo+PiAgICAgICAgIHJldHVybiAwOwo+PiAgY2xlYW51cDoKPj4g
ICAgICAgICBhbWRncHVfcmFzX3N5c2ZzX3JlbW92ZShhZGV2LCByYXNfYmxvY2spOwo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oCj4+IGluZGV4IDEwZmNhMDM5MzEwNi4u
MjU2Y2VhNWQzNGYyIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcmFzLmgKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jh
cy5oCj4+IEBAIC0zNDAsNiArMzQwLDExIEBAIHN0cnVjdCBhbWRncHVfcmFzIHsKPj4KPj4gICAg
ICAgICAvKiBkaXNhYmxlIHJhcyBlcnJvciBjb3VudCBoYXJ2ZXN0IGluIHJlY292ZXJ5ICovCj4+
ICAgICAgICAgYm9vbCBkaXNhYmxlX3Jhc19lcnJfY250X2hhcnZlc3Q7Cj4+ICsKPj4gKyAgICAg
ICAvKiBSQVMgY291bnQgZXJyb3JzIGRlbGF5ZWQgd29yayAqLwo+PiArICAgICAgIHN0cnVjdCBk
ZWxheWVkX3dvcmsgcmFzX2NvdW50ZV9kZWxheV93b3JrOwo+PiArICAgICAgIGF0b21pY190IHJh
c191ZV9jb3VudDsKPj4gKyAgICAgICBhdG9taWNfdCByYXNfY2VfY291bnQ7Cj4+ICB9Owo+Pgo+
PiAgc3RydWN0IHJhc19mc19kYXRhIHsKPj4gLS0KPj4gMi4zMS4xLjUyNy5nMmQ2NzdlNWIxNQo+
Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBh
bWQtZ2Z4IG1haWxpbmcgbGlzdAo+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBo
dHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMl
M0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZhbWQt
Z2Z4JmFtcDtkYXRhPTA0JTdDMDElN0NsdWJlbi50dWlrb3YlNDBhbWQuY29tJTdDMTY4NjBiMDQw
NDA2NDlmZTgxZDIwOGQ5MWZjOGZiMDAlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgz
ZCU3QzAlN0MwJTdDNjM3NTc1NzcwMzQwODYyNjE5JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5
SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJ
Nk1uMCUzRCU3QzEwMDAmYW1wO3NkYXRhPTRLSXlvUE9ydkNDQzlsalFRaEpseEtQaGpPTmlGSyUy
RkVBSE5YRWMzMEJ0USUzRCZhbXA7cmVzZXJ2ZWQ9MAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4Cg==
