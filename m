Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 240CC1C6ACC
	for <lists+amd-gfx@lfdr.de>; Wed,  6 May 2020 10:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86BF26E82C;
	Wed,  6 May 2020 08:06:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E406E82C
 for <amd-gfx@lists.freedesktop.org>; Wed,  6 May 2020 08:06:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcf2wCFO0O/4grZPAHxLQ+SDEhE/+jB6KfPt4LZDh9STlwGwhEA5e9vYDZDoWm1JQwHcD4zBt662HAaVCzcimLxnhWjefmLcG4AQ9ikElfGILplvYBO5fu1irP/Y0eYuzZXzIxXM61sCdKK4tLwVhEVXrs2mJxDTsZeCnbpC7wo/s8Swju5wl9uBFbLepuiONbOI08xAoe9E2ekL1EEJg2YHg2yvikLcIp6SDvoRMFRBdchlYd5T6eRLfe571zbLF+Ir5khQY+4Jw7Pp6IZeKE8+YZweyblNh8Vu1oxf9QQKGy53xC1EH50aR+948NQWynqx0j2OsNjMuTkzTRnpeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4ch+JTd/U64MYlwM+psqbyzb2NWiDYr5P5QD+I2VE4=;
 b=ApLp7Fh8bu4OQQ2/GjUhT+U1SNyzRhlfVIPB/IAXG5DkP8+RqhsDuVuLoOrFlznkPnoGLamcwlpWXq9M1ccMP6GwtVUkrvbfGzHr43PGjnD6gpHl634bMtv5nkaRtq0XFb15oTdv5jxx+SBa+Rbu5lt+hCnidU9WeSkU4NBov2cOZj/akrKOfraMB76SCzvAbDGzF1O1aa2d/VJwldCeDvKtfgQOgUnMxic0WMRQaWcMXGjk3qn5w0BMSiTVNdyR6kwRLbg3qwK96U8EafuBR2vGxHtEatxlIjSWZLRcqsdJwGK9oLrh8U2HrKNOcZ6Kxq2C/hbMUHDjHra6GrzDkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4ch+JTd/U64MYlwM+psqbyzb2NWiDYr5P5QD+I2VE4=;
 b=n72mA6Fq1gjIYbWy1rdYsV5OTAedSZ3cYVtBkCcdt79x8FD0jyq/mVLVSJwqpsJH69XuhUSOi+abl/bCyrVTUNNrJhhlIXw4kXBwfVz1uYgvzVAaXlxUDBGxbtirfYgS3vBnSOGVArdboYxtRLGyuhbgdsIhW3VWHcAHr/CdCNU=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB4282.namprd12.prod.outlook.com (2603:10b6:5:223::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Wed, 6 May
 2020 08:05:59 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.2979.027; Wed, 6 May 2020
 08:05:59 +0000
Subject: Re: [PATCH] drm/amdgpu: Add autodump debugfs node for gpu reset v4
To: "Zhao, Jiange" <Jiange.Zhao@amd.com>,
 "Pelloux-prayer, Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20200429050639.20859-1-jianzh@amd.com>
 <BY5PR12MB38443C7B1DE143B954671CECE1AD0@BY5PR12MB3844.namprd12.prod.outlook.com>
 <3b89b70e-6f21-241d-77e1-9cfbcbbde60b@amd.com>
 <c8ed8549-3cc7-2b67-70f9-016fab7016ad@amd.com>
 <BY5PR12MB384471B8C75E4001456A187AE1A40@BY5PR12MB3844.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ee6a4b72-28c4-a0cc-51a7-db5193827c0c@amd.com>
Date: Wed, 6 May 2020 10:05:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <BY5PR12MB384471B8C75E4001456A187AE1A40@BY5PR12MB3844.namprd12.prod.outlook.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0002.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::12) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0002.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26 via Frontend
 Transport; Wed, 6 May 2020 08:05:57 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 86bff55f-c191-4fda-5207-08d7f1944fdc
X-MS-TrafficTypeDiagnostic: DM6PR12MB4282:|DM6PR12MB4282:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB428293097CBC0368F32614F783A40@DM6PR12MB4282.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 03950F25EC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YUHAEosWViBsjtOiydG3MTmA8BqTD6o5HJwuxullVr0jE1pu1XEkBEgs85RKzZ19tB0TQDO2C8DblBanrA8bDUVqNlYAlyteV3PGKbz4xKVvq3sw+6lznU/XhvfXBVtGhsD6CW16v3IRc2JMNhcYyet+ePfcNYPNtHwz5glsbiWsamDgCOBkIgk/UUA35fum3N2L4zNWX3B/utrSox2g0H99VMq9uDckyCTnAh9J3J+ybx4Pk3+RIxT8mEKMeoJsJuXwI7qCE5xm0zTgZW2A8blycxh6XlpeuqRjqaUltWoKy7p1ijBLAK1ZHMsvBMBkWxJ+oOneR14xGvQ92SBQgyOrw4rUcwK4i1CTLoC+rVmUFOTZy2TKYmhmLlqOc2G+tNSQw3MgiHk7C5bRRsbqJwN7/3KGaMbu+m6q8l6DRGMDSnhtxiru0+vgP+63I6mKgciiVX+01C7kqrmJHd1io51GhN0ca7ueDKkMywp4s115EgFT3rfdlf3+0yT9tVm1MNUFF+RPqmVwvLt/hXewrdHpPJdW+e20RFalyFyqsDWPw8+ppo9RJ4/1LKi9SkMLy+FzorWrObbEbAcO2XttdeFmZ2vvv05kOKg24PHzzyU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(396003)(376002)(39850400004)(366004)(346002)(33430700001)(36756003)(2616005)(53546011)(966005)(6666004)(6486002)(33440700001)(4326008)(186003)(16526019)(8676002)(31686004)(110136005)(54906003)(30864003)(86362001)(8936002)(478600001)(52116002)(31696002)(316002)(66946007)(66556008)(66476007)(2906002)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 7K/6PSirJeHpKRKJbybWnFGsFewRkaL58QcKuFw/sYnxL+vzpETGm3vxy37orsSX4h0f5Hj1NBQDtcpLnlW1giPr1Zr05KjDslZ1XDMfZ+18D7xopawxC7beZvPh2TRDFccRaSDROUEnAtRacabnULk1Ue4r3FMrDFeGyU+LrEf+2ETrOlifryXUlU6aF9q8pKjma91vUljt2vlvP63Yvmb+K8TPhLNycA6dgTICzTOzGNEOuvNxZ0o6u6M4anZ3b0FoLYRvQ/Z3ShCG0dbTeOEh4b7hc8UMYlPlxXtuypgCDmMDj/6MRKbTtaNUqYxGFg9njE7hEjIWckXiok9Xcas7N9JMTmUfYdkvO4EbqKc0+pea2clzjS2t3Bw3fVAWlt8abmnnAmy1lV3C8Z7s3+zBGejHAYFm+Kf3zPovpzdCRVghhdvxJ3YB7BAYXXsXEQ59XvKbKO3YQmV2ipc3UyVQHLxJWnFxeLdu3zlUwIQcB/uWE2RxDFPBtm8E+W6wuV2LYrURbuDETFDJj0SLDBNdu8oLc5lLLn/EYY/lZCZbYjDcsp3xLiRLsmHgpnRQX9CH+8oRo05elmIZR1ii+yEmHc4FzVMxbzC9lM0tXp+g6N0qT38Qp7n/D42OmiRhYiA/dy4EUP7ilaaMRWP2rPrjZ2xCIvUMxcxq0bPmJVtjpJcZ9szUeetgFqiMWF27MA8c1waoZB6/clkfr25+g7jf5oOM/3KVemgl3iedNUHebe8CpXpM/azhFU73BD4tzpsZ2T9UTzL5yNCoBTrBEyj5kl66ytToPoHw9hzmGL7hac4WFjjVxtBIdePOleWke3XH9l1oYYuWwQgIlxeQti5sGCjrJpGT6DmcF/zs4GY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86bff55f-c191-4fda-5207-08d7f1944fdc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2020 08:05:59.5239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qIpCIGdAGzT1j3iRXaqVZiksiNr2o7QXtTixIsdK/KmZFTfXpbJhXjafY2L/avj0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4282
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDYuMDUuMjAgdW0gMDU6NDUgc2NocmllYiBaaGFvLCBKaWFuZ2U6Cj4gW0FNRCBPZmZpY2lh
bCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQo+Cj4gSGkgQ2hyaXN0aWFu
LAo+Cj4+IEhpIEppYW5nZSwgd2VsbCB0aGF0IGxvb2tzIGNvcnJlY3QgdG8gbWUsIGJ1dCBzZWVt
cyB0byBiZSBhIGJpdCB0byBjb21wbGljYXRlZC4gV2hhdCBleGFjdGx5IHdhcyB3cm9uZyB3aXRo
IHZlcnNpb24gMz8KPiAoMSkgSWYgeW91IG9wZW4gYW1kZ3B1X2F1dG9kdW1wLCB1c2UgaXQgYW5k
IGNsb3NlIGl0LCB0aGVuIHlvdSBjYW4ndCBvcGVuIGl0IGFnYWluLCBiZWNhdXNlIHdhaXRfZm9y
X2NvbXBsZXRpb25faW50ZXJydXB0aWJsZV90aW1lb3V0KCkgd291bGQgZGVjcmVtZW50IGFtZGdw
dV9hdXRvZHVtcC5kdW1waW5nLmRvbmUgdG8gMCwgdGhlbiAub3BlbigpIHdvdWxkIGFsd2F5cyBy
ZXR1cm4gZmFpbHVyZSBleGNlcHQgdGhlIGZpcnN0IHRpbWUuCgpJbiB0aGlzIGNhc2Ugd2Ugc2hv
dWxkIHByb2JhYmx5IGp1c3QgdXNlIGNvbXBsZXRlX2FsbCgpIGluc3RlYWQgb2YganVzdCAKY29t
cGxldGUoKS4gU28gdGhhdCB0aGUgc3RydWN0IGNvbXBsZXRlIHN0YXlzIGluIHRoZSBjb21wbGV0
ZWQgc3RhdGUuCgo+ICgyKSByZXNldCBsb2NrIGlzIG5vdCBvcHRpbWFsIGluIHRoaXMgY2FzZS4g
QmVjYXVzZSB1c2VybW9kZSBhcHAgd291bGQgdGFrZSBhbnkgb3BlcmF0aW9uIGF0IGFueSB0aW1l
IGFuZCB0aGVyZSBhcmUgc28gbWFueSByYWNlIGNvbmRpdGlvbnMgdG8gc29sdmUuIEEgZGVkaWNh
dGVkIGxvY2sgd291bGQgYmUgc2ltcGxlciBhbmQgY2xlYXJlci4KCkkgZG9uJ3QgdGhpbmsgdGhh
dCB0aGlzIHdpbGwgd29yay4gVXNpbmcgdGhlIHJlc2V0IGxvY2sgaXMgbWFuZGF0b3J5IApoZXJl
IG9yIG90aGVyd2lzZSB3ZSBhbHdheXMgcmFjZSBiZXR3ZWVuIGEgbmV3IHByb2Nlc3Mgb3Blbmlu
ZyB0aGUgZmlsZSAKYW5kIGFuIG9uZ29pbmcgR1BVIHJlc2V0LgoKSnVzdCBpbWFnaW5lIHdoYXQg
aGFwcGVucyB3aGVuIHRoZSBwcm9jZXNzIHdoaWNoIHdhaXRlZCBmb3IgdGhlIEdQVSAKcmVzZXQg
ZXZlbnQgZG9lc24ndCBkbyBhIGR1bXAsIGJ1dCBqdXN0IGNsb3NlcyBhbmQgaW1tZWRpYXRlbHkg
cmVvcGVucyAKdGhlIGZpbGUgd2hpbGUgdGhlIGxhc3QgcmVzZXQgaXMgc3RpbGwgb25nb2luZy4K
CldoYXQgd2UgY291bGQgZG8gaGVyZSBpcyB1c2luZyBtdXRleF90cnlsb2NrKCkgb24gdGhlIHJl
c2V0IGxvY2sgYW5kIApyZXR1cm4gLUVCVVNZIHdoZW4gYSByZXNldCBpcyBvbmdvaW5nLiBPciBt
YXliZSBiZXR0ZXIgCm11dGV4X2xvY2tfaW50ZXJydXB0aWJsZSgpLgoKPj4gUGxlYXNlIGNvbXBs
ZXRlbHkgZHJvcCB0aGlzIGV4dHJhIGNoZWNrLiBXYWtpbmcgdXAgdGhlIHF1ZXVlIGFuZCB3YWl0
aW5nIGZvciBjb21wbGV0aW9uIHNob3VsZCBhbHdheXMgd29yayB3aGVuIGRvbmUgcmlnaHQuCj4g
VGhpcyBjaGVjayBpcyB2ZXJ5IG5lY2Vzc2FyeSwgYmVjYXVzZSBpZiB0aGVyZSBpcyBubyB1c2Vy
bW9kZSBhcHAgbGlzdGVuaW5nLCB0aGUgZm9sbG93aW5nIHdhaXRfZm9yX2NvbXBsZXRpb25faW50
ZXJydXB0aWJsZV90aW1lb3V0KCkgd291bGQgd2FpdCB1bnRpbCB0aW1lb3V0IGFueXdheSwgd2hp
Y2ggaXMgMTAgbWludXRlcyBmb3Igbm90aGluZy4gVGhpcyBpcyBub3Qgd2hhdCB3ZSB3YW50ZWQu
CgpTZWUgdGhlIHdhaXRfZXZlbnRfKiBkb2N1bWVudGF0aW9uLCBleGFjdGx5IHRoYXQncyB3aGF0
IHlvdSBzaG91bGQgbmV2ZXIgZG8uCgpJbnN0ZWFkIGp1c3Qgc2lnbmFsIHRoZSBzdHJ1Y3QgY29t
cGxldGlvbiB3aXRoIGNvbXBsZXRlX2FsbCgpIGRpcmVjdGx5IAphZnRlciBpdCBpcyBjcmVhdGVk
LiBUaGlzIHdheSB0aGUgd2FrZXVwIGlzIGEgbm8tb3AgYW5kIHdhaXRpbmcgZm9yIHRoZSAKc3Ry
dWN0IGNvbXBsZXRpb24gY29udGludWVzIGltbWVkaWF0ZWx5LgoKUmVnYXJkcywKQ2hyaXN0aWFu
LgoKPgo+IEppYW5nZQo+Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBLb2Vu
aWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPgo+IFNlbnQ6IFdlZG5lc2Rh
eSwgQXByaWwgMjksIDIwMjAgMTA6MDkgUE0KPiBUbzogUGVsbG91eC1wcmF5ZXIsIFBpZXJyZS1l
cmljIDxQaWVycmUtZXJpYy5QZWxsb3V4LXByYXllckBhbWQuY29tPjsgWmhhbywgSmlhbmdlIDxK
aWFuZ2UuWmhhb0BhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzog
S3VlaGxpbmcsIEZlbGl4IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPjsgRGV1Y2hlciwgQWxleGFu
ZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgTGl1LCBNb25rIDxNb25rLkxpdUBhbWQu
Y29tPjsgWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KPiBTdWJqZWN0OiBS
ZTogW1BBVENIXSBkcm0vYW1kZ3B1OiBBZGQgYXV0b2R1bXAgZGVidWdmcyBub2RlIGZvciBncHUg
cmVzZXQgdjQKPgo+IEFtIDI5LjA0LjIwIHVtIDE2OjA0IHNjaHJpZWIgUGllcnJlLUVyaWMgUGVs
bG91eC1QcmF5ZXI6Cj4+IEhpIEppYW5nZSwKPj4KPj4gVGhpcyB2ZXJzaW9uIHNlZW1zIHRvIHdv
cmsgZmluZS4KPj4KPj4gVGVzdGVkLWJ5OiBQaWVycmUtRXJpYyBQZWxsb3V4LVByYXllcgo+PiA8
cGllcnJlLWVyaWMucGVsbG91eC1wcmF5ZXJAYW1kLmNvbT4KPj4KPj4KPj4gT24gMjkvMDQvMjAy
MCAwNzowOCwgWmhhbywgSmlhbmdlIHdyb3RlOgo+Pj4gW0FNRCBPZmZpY2lhbCBVc2UgT25seSAt
IEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQo+Pj4KPj4+Cj4+PiBIaSBhbGwsCj4+Pgo+Pj4g
SSB3b3JrZWQgb3V0IHRoZSByYWNlIGNvbmRpdGlvbiBhbmQgaGVyZSBpcyB2ZXJzaW9uIDUuIFBs
ZWFzZSBoYXZlIGEgbG9vay4KPj4+Cj4+PiBKaWFuZ2UKPj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4gLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4gLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4gLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+
PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+PiAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+PiAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPj4+ICpGcm9tOiogWmhhbywgSmlhbmdlIDxKaWFuZ2UuWmhhb0BhbWQu
Y29tPgo+Pj4gKlNlbnQ6KiBXZWRuZXNkYXksIEFwcmlsIDI5LCAyMDIwIDE6MDYgUE0KPj4+ICpU
bzoqIGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIDxhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZz4KPj4+ICpDYzoqIEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFt
ZC5jb20+OyBLdWVobGluZywgRmVsaXgKPj4+IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPjsgUGVs
bG91eC1wcmF5ZXIsIFBpZXJyZS1lcmljCj4+PiA8UGllcnJlLWVyaWMuUGVsbG91eC1wcmF5ZXJA
YW1kLmNvbT47IERldWNoZXIsIEFsZXhhbmRlcgo+Pj4gPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5j
b20+OyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsKPj4+IExpdSwgTW9u
ayA8TW9uay5MaXVAYW1kLmNvbT47IFpoYW8sIEppYW5nZSA8SmlhbmdlLlpoYW9AYW1kLmNvbT4K
Pj4+ICpTdWJqZWN0OiogW1BBVENIXSBkcm0vYW1kZ3B1OiBBZGQgYXV0b2R1bXAgZGVidWdmcyBu
b2RlIGZvciBncHUKPj4+IHJlc2V0IHY0Cj4+PiAgICAKPj4+IEZyb206IEppYW5nZSBaaGFvIDxK
aWFuZ2UuWmhhb0BhbWQuY29tPgo+Pj4KPj4+IFdoZW4gR1BVIGdvdCB0aW1lb3V0LCBpdCB3b3Vs
ZCBub3RpZnkgYW4gaW50ZXJlc3RlZCBwYXJ0IG9mIGFuCj4+PiBvcHBvcnR1bml0eSB0byBkdW1w
IGluZm8gYmVmb3JlIGFjdHVhbCBHUFUgcmVzZXQuCj4+Pgo+Pj4gQSB1c2VybW9kZSBhcHAgd291
bGQgb3BlbiAnYXV0b2R1bXAnIG5vZGUgdW5kZXIgZGVidWdmcyBzeXN0ZW0gYW5kCj4+PiBwb2xs
KCkgZm9yIHJlYWRhYmxlL3dyaXRhYmxlLiBXaGVuIGEgR1BVIHJlc2V0IGlzIGR1ZSwgYW1kZ3B1
IHdvdWxkCj4+PiBub3RpZnkgdXNlcm1vZGUgYXBwIHRocm91Z2ggd2FpdF9xdWV1ZV9oZWFkIGFu
ZCBnaXZlIGl0IDEwIG1pbnV0ZXMgdG8KPj4+IGR1bXAgaW5mby4KPj4+Cj4+PiBBZnRlciB1c2Vy
bW9kZSBhcHAgaGFzIGRvbmUgaXRzIHdvcmssIHRoaXMgJ2F1dG9kdW1wJyBub2RlIGlzIGNsb3Nl
ZC4KPj4+IE9uIG5vZGUgY2xvc3VyZSwgYW1kZ3B1IGdldHMgdG8ga25vdyB0aGUgZHVtcCBpcyBk
b25lIHRocm91Z2ggdGhlCj4+PiBjb21wbGV0aW9uIHRoYXQgaXMgdHJpZ2dlcmVkIGluIHJlbGVh
c2UoKS4KPj4+Cj4+PiBUaGVyZSBpcyBubyB3cml0ZSBvciByZWFkIGNhbGxiYWNrIGJlY2F1c2Ug
bmVjZXNzYXJ5IGluZm8gY2FuIGJlCj4+PiBvYnRhaW5lZCB0aHJvdWdoIGRtZXNnIGFuZCB1bXIu
IE1lc3NhZ2VzIGJhY2sgYW5kIGZvcnRoIGJldHdlZW4KPj4+IHVzZXJtb2RlIGFwcCBhbmQgYW1k
Z3B1IGFyZSB1bm5lY2Vzc2FyeS4KPj4+Cj4+PiB2MjogKDEpIGNoYW5nZWQgJ3JlZ2lzdGVyZWQn
IHRvICdhcHBfbGlzdGVuaW5nJwo+Pj4gICDCoMKgwqAgKDIpIGFkZCBhIG11dGV4IGluIG9wZW4o
KSB0byBwcmV2ZW50IHJhY2UgY29uZGl0aW9uCj4+Pgo+Pj4gdjMgKGNoayk6IGdyYWIgdGhlIHJl
c2V0IGxvY2sgdG8gYXZvaWQgcmFjZSBpbiBhdXRvZHVtcF9vcGVuLAo+Pj4gICDCoMKgwqDCoMKg
wqDCoMKgwqAgcmVuYW1lIGRlYnVnZnMgZmlsZSB0byBhbWRncHVfYXV0b2R1bXAsCj4+PiAgIMKg
wqDCoMKgwqDCoMKgwqDCoCBwcm92aWRlIGF1dG9kdW1wX3JlYWQgYXMgd2VsbCwKPj4+ICAgwqDC
oMKgwqDCoMKgwqDCoMKgIHN0eWxlIGFuZCBjb2RlIGNsZWFudXBzCj4+Pgo+Pj4gdjQ6IGFkZCAn
Ym9vbCBhcHBfbGlzdGVuaW5nJyB0byBkaWZmZXJlbnRpYXRlIHNpdHVhdGlvbnMsIHNvIHRoYXQK
Pj4+ICAgwqDCoMKgIHRoZSBub2RlIGNhbiBiZSByZW9wZW5lZDsgYWxzbywgdGhlcmUgaXMgbm8g
bmVlZCB0byB3YWl0IGZvcgo+Pj4gICDCoMKgwqAgY29tcGxldGlvbiB3aGVuIG5vIGFwcCBpcyB3
YWl0aW5nIGZvciBhIGR1bXAuCj4+Pgo+Pj4gdjU6IGNoYW5nZSAnYm9vbCBhcHBfbGlzdGVuaW5n
JyB0byAnZW51bSBhbWRncHVfYXV0b2R1bXBfc3RhdGUnCj4+PiAgIMKgwqDCoCBhZGQgJ2FwcF9z
dGF0ZV9tdXRleCcgZm9yIHJhY2UgY29uZGl0aW9uczoKPj4+ICAgwqDCoMKgwqDCoMKgwqAgKDEp
T25seSAxIHVzZXIgY2FuIG9wZW4gdGhpcyBmaWxlIG5vZGUKPj4+ICAgwqDCoMKgwqDCoMKgwqAg
KDIpd2FpdF9kdW1wKCkgY2FuIG9ubHkgdGFrZSBlZmZlY3QgYWZ0ZXIgcG9sbCgpIGV4ZWN1dGVk
Lgo+Pj4gICDCoMKgwqDCoMKgwqDCoCAoMyllbGltaW5hdGVkIHRoZSByYWNlIGNvbmRpdGlvbiBi
ZXR3ZWVuIHJlbGVhc2UoKSBhbmQKPj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd2FpdF9kdW1w
KCkKPiBIaSBKaWFuZ2UsIHdlbGwgdGhhdCBsb29rcyBjb3JyZWN0IHRvIG1lLCBidXQgc2VlbXMg
dG8gYmUgYSBiaXQgdG8gY29tcGxpY2F0ZWQuIFdoYXQgZXhhY3RseSB3YXMgd3Jvbmcgd2l0aCB2
ZXJzaW9uIDM/Cj4KPiBPbmUgbW9yZSBjb21tZW50IGJlbG93Lgo+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBKaWFuZ2UgWmhhbyA8SmlhbmdlLlpoYW9AYW1kLmNvbT4KPj4+IC0tLQo+Pj4gICDCoGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5owqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArCj4+
PiAgIMKgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYyB8IDkyCj4+
PiArKysrKysrKysrKysrKysrKysrKy0KPj4+ICAgwqBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGVidWdmcy5oIHwgMTQgKysrKwo+Pj4gICDCoGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kZXZpY2UuY8KgIHzCoCAyICsKPj4+ICAgwqA0IGZpbGVzIGNoYW5nZWQs
IDEwOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdS5oCj4+PiBpbmRleCBiYzFlMGZkNzFhMDkuLjZmOGVmOThjNGI5NyAx
MDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCj4+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAo+Pj4gQEAgLTk5MCw2ICs5
OTAsOCBAQCBzdHJ1Y3QgYW1kZ3B1X2RldmljZSB7Cj4+PiAgIMKgwqDCoMKgwqDCoMKgwqAgY2hh
csKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBw
cm9kdWN0X251bWJlclsxNl07Cj4+PiAgIMKgwqDCoMKgwqDCoMKgwqAgY2hhcsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcm9kdWN0X25hbWVb
MzJdOwo+Pj4gICDCoMKgwqDCoMKgwqDCoMKgIGNoYXLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2VyaWFsWzE2XTsKPj4+ICsKPj4+ICvCoMKg
wqDCoMKgwqAgc3RydWN0IGFtZGdwdV9hdXRvZHVtcMKgwqDCoMKgwqDCoMKgwqDCoCBhdXRvZHVt
cDsKPj4+ICAgwqB9Owo+Pj4gICAgCj4+PiAgIMKgc3RhdGljIGlubGluZSBzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYW1kZ3B1X3R0bV9hZGV2KHN0cnVjdAo+Pj4gdHRtX2JvX2RldmljZSAqYmRldikg
ZGlmZiAtLWdpdAo+Pj4gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdm
cy5jCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMKPj4+
IGluZGV4IDFhNDg5NGZhMzY5My4uMWQ0YTk1ZThhZDViIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYwo+Pj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYwo+Pj4gQEAgLTI3LDcgKzI3LDcgQEAK
Pj4+ICAgwqAjaW5jbHVkZSA8bGludXgvcGNpLmg+Cj4+PiAgIMKgI2luY2x1ZGUgPGxpbnV4L3Vh
Y2Nlc3MuaD4KPj4+ICAgwqAjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPgo+Pj4gLQo+Pj4g
KyNpbmNsdWRlIDxsaW51eC9wb2xsLmg+Cj4+PiAgIMKgI2luY2x1ZGUgPGRybS9kcm1fZGVidWdm
cy5oPgo+Pj4gICAgCj4+PiAgIMKgI2luY2x1ZGUgImFtZGdwdS5oIgo+Pj4gQEAgLTc0LDggKzc0
LDk2IEBAIGludCBhbWRncHVfZGVidWdmc19hZGRfZmlsZXMoc3RydWN0IGFtZGdwdV9kZXZpY2UK
Pj4+ICphZGV2LAo+Pj4gICDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+Pj4gICDCoH0KPj4+
ICAgIAo+Pj4gK2ludCBhbWRncHVfZGVidWdmc193YWl0X2R1bXAoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpIHsgI2lmCj4+PiArZGVmaW5lZChDT05GSUdfREVCVUdfRlMpCj4+PiArwqDCoMKg
wqDCoMKgIHVuc2lnbmVkIGxvbmcgdGltZW91dCA9IDYwMCAqIEhaOwo+Pj4gK8KgwqDCoMKgwqDC
oCBpbnQgcmV0Owo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoCBtdXRleF9sb2NrKCZhZGV2LT5hdXRv
ZHVtcC5hcHBfc3RhdGVfbXV0ZXgpOwo+Pj4gK8KgwqDCoMKgwqDCoCBpZiAoYWRldi0+YXV0b2R1
bXAuYXBwX3N0YXRlICE9IEFNREdQVV9BVVRPRFVNUF9MSVNURU5JTkcpIHsKPj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIG11dGV4X3VubG9jaygmYWRldi0+YXV0b2R1bXAuYXBwX3N0
YXRlX211dGV4KTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+
Pj4gK8KgwqDCoMKgwqDCoCB9Cj4+PiArwqDCoMKgwqDCoMKgIG11dGV4X3VubG9jaygmYWRldi0+
YXV0b2R1bXAuYXBwX3N0YXRlX211dGV4KTsKPiBQbGVhc2UgY29tcGxldGVseSBkcm9wIHRoaXMg
ZXh0cmEgY2hlY2suIFdha2luZyB1cCB0aGUgcXVldWUgYW5kIHdhaXRpbmcgZm9yIGNvbXBsZXRp
b24gc2hvdWxkIGFsd2F5cyB3b3JrIHdoZW4gZG9uZSByaWdodC4KPgo+IFJlZ2FyZHMsCj4gQ2hy
aXN0aWFuLgo+Cj4+PiArCj4+PiArwqDCoMKgwqDCoMKgIHdha2VfdXBfaW50ZXJydXB0aWJsZSgm
YWRldi0+YXV0b2R1bXAuZ3B1X2hhbmcpOwo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoCByZXQgPQo+
Pj4gK3dhaXRfZm9yX2NvbXBsZXRpb25faW50ZXJydXB0aWJsZV90aW1lb3V0KCZhZGV2LT5hdXRv
ZHVtcC5kdW1waW5nLAo+Pj4gK3RpbWVvdXQpOwo+Pj4gK8KgwqDCoMKgwqDCoCBpZiAocmV0ID09
IDApIHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByX2VycigiYXV0b2R1bXA6
IHRpbWVvdXQsIG1vdmUgb24gdG8gZ3B1Cj4+PiArcmVjb3ZlcnlcbiIpOwo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FVElNRURPVVQ7Cj4+PiArwqDCoMKgwqDCoMKg
IH0KPj4+ICsjZW5kaWYKPj4+ICvCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+PiArfQo+Pj4gKwo+
Pj4gICDCoCNpZiBkZWZpbmVkKENPTkZJR19ERUJVR19GUykKPj4+ICAgIAo+Pj4gK3N0YXRpYyBp
bnQgYW1kZ3B1X2RlYnVnZnNfYXV0b2R1bXBfb3BlbihzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1
Y3QKPj4+ICtmaWxlICpmaWxlKSB7Cj4+PiArwqDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2ID0gaW5vZGUtPmlfcHJpdmF0ZTsKPj4+ICvCoMKgwqDCoMKgwqAgaW50IHJldDsK
Pj4+ICsKPj4+ICvCoMKgwqDCoMKgwqAgZmlsZS0+cHJpdmF0ZV9kYXRhID0gYWRldjsKPj4+ICsK
Pj4+ICvCoMKgwqDCoMKgwqAgbXV0ZXhfbG9jaygmYWRldi0+YXV0b2R1bXAuYXBwX3N0YXRlX211
dGV4KTsKPj4+ICvCoMKgwqDCoMKgwqAgaWYgKGFkZXYtPmF1dG9kdW1wLmFwcF9zdGF0ZSA9PSBB
TURHUFVfQVVUT0RVTVBfTk9fQVBQKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBhZGV2LT5hdXRvZHVtcC5hcHBfc3RhdGUgPQo+Pj4gK0FNREdQVV9BVVRPRFVNUF9SRUdJU1RF
UkVEOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gMDsKPj4+ICvCoMKg
wqDCoMKgwqAgfSBlbHNlIHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9
IC1FQlVTWTsKPj4+ICvCoMKgwqDCoMKgwqAgfQo+Pj4gK8KgwqDCoMKgwqDCoCBtdXRleF91bmxv
Y2soJmFkZXYtPmF1dG9kdW1wLmFwcF9zdGF0ZV9tdXRleCk7Cj4+PiArCj4+PiArwqDCoMKgwqDC
oMKgIHJldHVybiByZXQ7Cj4+PiArfQo+Pj4gKwo+Pj4gK3N0YXRpYyBpbnQgYW1kZ3B1X2RlYnVn
ZnNfYXV0b2R1bXBfcmVsZWFzZShzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+Pj4gK3N0cnVjdCBmaWxl
ICpmaWxlKSB7Cj4+PiArwqDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0g
ZmlsZS0+cHJpdmF0ZV9kYXRhOwo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoCBtdXRleF9sb2NrKCZh
ZGV2LT5hdXRvZHVtcC5hcHBfc3RhdGVfbXV0ZXgpOwo+Pj4gK8KgwqDCoMKgwqDCoCBjb21wbGV0
ZSgmYWRldi0+YXV0b2R1bXAuZHVtcGluZyk7Cj4+PiArwqDCoMKgwqDCoMKgIGFkZXYtPmF1dG9k
dW1wLmFwcF9zdGF0ZSA9IEFNREdQVV9BVVRPRFVNUF9OT19BUFA7Cj4+PiArwqDCoMKgwqDCoMKg
IG11dGV4X3VubG9jaygmYWRldi0+YXV0b2R1bXAuYXBwX3N0YXRlX211dGV4KTsKPj4+ICvCoMKg
wqDCoMKgwqAgcmV0dXJuIDA7Cj4+PiArfQo+Pj4gKwo+Pj4gK3N0YXRpYyB1bnNpZ25lZCBpbnQg
YW1kZ3B1X2RlYnVnZnNfYXV0b2R1bXBfcG9sbChzdHJ1Y3QgZmlsZSAqZmlsZSwKPj4+ICtzdHJ1
Y3QgcG9sbF90YWJsZV9zdHJ1Y3QgKnBvbGxfdGFibGUpIHsKPj4+ICvCoMKgwqDCoMKgwqAgc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBmaWxlLT5wcml2YXRlX2RhdGE7Cj4+PiArCj4+PiAr
wqDCoMKgwqDCoMKgIG11dGV4X2xvY2soJmFkZXYtPmF1dG9kdW1wLmFwcF9zdGF0ZV9tdXRleCk7
Cj4+PiArwqDCoMKgwqDCoMKgIHBvbGxfd2FpdChmaWxlLCAmYWRldi0+YXV0b2R1bXAuZ3B1X2hh
bmcsIHBvbGxfdGFibGUpOwo+Pj4gK8KgwqDCoMKgwqDCoCBhZGV2LT5hdXRvZHVtcC5hcHBfc3Rh
dGUgPSBBTURHUFVfQVVUT0RVTVBfTElTVEVOSU5HOwo+Pj4gK8KgwqDCoMKgwqDCoCBtdXRleF91
bmxvY2soJmFkZXYtPmF1dG9kdW1wLmFwcF9zdGF0ZV9tdXRleCk7Cj4+PiArCj4+PiArwqDCoMKg
wqDCoMKgIGlmIChhZGV2LT5pbl9ncHVfcmVzZXQpCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gUE9MTElOIHwgUE9MTFJETk9STSB8IFBPTExXUk5PUk07Cj4+PiArCj4+
PiArwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+Pj4gK30KPj4+ICsKPj4+ICtzdGF0aWMgY29uc3Qg
c3RydWN0IGZpbGVfb3BlcmF0aW9ucyBhdXRvZHVtcF9kZWJ1Z19mb3BzID0gewo+Pj4gK8KgwqDC
oMKgwqDCoCAub3duZXIgPSBUSElTX01PRFVMRSwKPj4+ICvCoMKgwqDCoMKgwqAgLm9wZW4gPSBh
bWRncHVfZGVidWdmc19hdXRvZHVtcF9vcGVuLAo+Pj4gK8KgwqDCoMKgwqDCoCAucG9sbCA9IGFt
ZGdwdV9kZWJ1Z2ZzX2F1dG9kdW1wX3BvbGwsCj4+PiArwqDCoMKgwqDCoMKgIC5yZWxlYXNlID0g
YW1kZ3B1X2RlYnVnZnNfYXV0b2R1bXBfcmVsZWFzZSwgfTsKPj4+ICsKPj4+ICtzdGF0aWMgdm9p
ZCBhbWRncHVfZGVidWdmc19hdXRvZHVtcF9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KQo+Pj4gK3sKPj4+ICvCoMKgwqDCoMKgwqAgaW5pdF9jb21wbGV0aW9uKCZhZGV2LT5hdXRvZHVt
cC5kdW1waW5nKTsKPj4+ICvCoMKgwqDCoMKgwqAgaW5pdF93YWl0cXVldWVfaGVhZCgmYWRldi0+
YXV0b2R1bXAuZ3B1X2hhbmcpOwo+Pj4gK8KgwqDCoMKgwqDCoCBhZGV2LT5hdXRvZHVtcC5hcHBf
c3RhdGUgPSBBTURHUFVfQVVUT0RVTVBfTk9fQVBQOwo+Pj4gK8KgwqDCoMKgwqDCoCBtdXRleF9p
bml0KCZhZGV2LT5hdXRvZHVtcC5hcHBfc3RhdGVfbXV0ZXgpOwo+Pj4gKwo+Pj4gK8KgwqDCoMKg
wqDCoCBkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJhbWRncHVfYXV0b2R1bXAiLCAwNjAwLAo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYWRldi0+ZGRldi0+cHJpbWFyeS0+ZGVidWdmc19y
b290LAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYWRldiwgJmF1dG9kdW1wX2Rl
YnVnX2ZvcHMpOyB9Cj4+PiArCj4+PiAgIMKgLyoqCj4+PiAgIMKgICogYW1kZ3B1X2RlYnVnZnNf
cHJvY2Vzc19yZWdfb3AgLSBIYW5kbGUgTU1JTyByZWdpc3Rlcgo+Pj4gcmVhZHMvd3JpdGVzCj4+
PiAgIMKgICoKPj4+IEBAIC0xNDM0LDYgKzE1MjIsOCBAQCBpbnQgYW1kZ3B1X2RlYnVnZnNfaW5p
dChzdHJ1Y3QgYW1kZ3B1X2RldmljZQo+Pj4gKmFkZXYpCj4+PiAgICAKPj4+ICAgwqDCoMKgwqDC
oMKgwqDCoCBhbWRncHVfcmFzX2RlYnVnZnNfY3JlYXRlX2FsbChhZGV2KTsKPj4+ICAgIAo+Pj4g
K8KgwqDCoMKgwqDCoCBhbWRncHVfZGVidWdmc19hdXRvZHVtcF9pbml0KGFkZXYpOwo+Pj4gKwo+
Pj4gICDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBhbWRncHVfZGVidWdmc19hZGRfZmlsZXMoYWRl
diwgYW1kZ3B1X2RlYnVnZnNfbGlzdCwKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAKPj4+IEFSUkFZX1NJWkUoYW1kZ3B1X2RlYnVnZnNfbGlzdCkpOwo+Pj4g
ICDCoH0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZGVidWdmcy5oCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2Zz
LmgKPj4+IGluZGV4IGRlMTJkMTEwMTUyNi4uNTFiNGVhNzkwNjg2IDEwMDY0NAo+Pj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuaAo+Pj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuaAo+Pj4gQEAgLTMxLDYgKzMx
LDE5IEBAIHN0cnVjdCBhbWRncHVfZGVidWdmcyB7Cj4+PiAgIMKgwqDCoMKgwqDCoMKgwqAgdW5z
aWduZWTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbnVtX2ZpbGVzOwo+Pj4gICDCoH07
Cj4+PiAgICAKPj4+ICtlbnVtIGFtZGdwdV9hdXRvZHVtcF9zdGF0ZSB7Cj4+PiArwqDCoMKgwqDC
oMKgIEFNREdQVV9BVVRPRFVNUF9OT19BUFAsCj4+PiArwqDCoMKgwqDCoMKgIEFNREdQVV9BVVRP
RFVNUF9SRUdJU1RFUkVELAo+Pj4gK8KgwqDCoMKgwqDCoCBBTURHUFVfQVVUT0RVTVBfTElTVEVO
SU5HCj4+PiArfTsKPj4+ICsKPj4+ICtzdHJ1Y3QgYW1kZ3B1X2F1dG9kdW1wIHsKPj4+ICvCoMKg
wqDCoMKgwqAgc3RydWN0IG11dGV4wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgYXBwX3N0YXRlX211dGV4Owo+Pj4gK8KgwqDCoMKgwqDCoCBlbnVtIGFtZGdwdV9hdXRvZHVt
cF9zdGF0ZcKgwqDCoMKgwqAgYXBwX3N0YXRlOwo+Pj4gK8KgwqDCoMKgwqDCoCBzdHJ1Y3QgY29t
cGxldGlvbsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZHVtcGluZzsKPj4+ICvCoMKgwqDC
oMKgwqAgc3RydWN0IHdhaXRfcXVldWVfaGVhZMKgwqDCoMKgwqDCoMKgwqDCoCBncHVfaGFuZzsg
fTsKPj4+ICsKPj4+ICAgwqBpbnQgYW1kZ3B1X2RlYnVnZnNfcmVnc19pbml0KHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KTsKPj4+ICAgwqBpbnQgYW1kZ3B1X2RlYnVnZnNfaW5pdChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldik7Cj4+PiAgIMKgdm9pZCBhbWRncHVfZGVidWdmc19maW5pKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsgQEAgLTQwLDMKPj4+ICs1Myw0IEBAIGludCBhbWRn
cHVfZGVidWdmc19hZGRfZmlsZXMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4+PiAgIMKg
aW50IGFtZGdwdV9kZWJ1Z2ZzX2ZlbmNlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
Owo+Pj4gICDCoGludCBhbWRncHVfZGVidWdmc19maXJtd2FyZV9pbml0KHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KTsKPj4+ICAgwqBpbnQgYW1kZ3B1X2RlYnVnZnNfZ2VtX2luaXQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwo+Pj4gK2ludCBhbWRncHVfZGVidWdmc193YWl0X2R1bXAo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPj4+IGluZGV4IGU2OTc4YTJjMjZiNy4uODEwOTk0NjA3
NWIxIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNl
LmMKPj4+IEBAIC0zOTEyLDYgKzM5MTIsOCBAQCBzdGF0aWMgaW50IGFtZGdwdV9kZXZpY2VfcHJl
X2FzaWNfcmVzZXQoc3RydWN0Cj4+PiBhbWRncHVfZGV2aWNlICphZGV2LAo+Pj4gICDCoMKgwqDC
oMKgwqDCoMKgIGludCBpLCByID0gMDsKPj4+ICAgwqDCoMKgwqDCoMKgwqDCoCBib29sIG5lZWRf
ZnVsbF9yZXNldMKgID0gKm5lZWRfZnVsbF9yZXNldF9hcmc7Cj4+PiAgICAKPj4+ICvCoMKgwqDC
oMKgwqAgYW1kZ3B1X2RlYnVnZnNfd2FpdF9kdW1wKGFkZXYpOwo+Pj4gKwo+Pj4gICDCoMKgwqDC
oMKgwqDCoMKgIC8qIGJsb2NrIGFsbCBzY2hlZHVsZXJzIGFuZCByZXNldCBnaXZlbiBqb2IncyBy
aW5nICovCj4+PiAgIMKgwqDCoMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IEFNREdQVV9NQVhf
UklOR1M7ICsraSkgewo+Pj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1
Y3QgYW1kZ3B1X3JpbmcgKnJpbmcgPSBhZGV2LT5yaW5nc1tpXTsKPj4+IC0tCj4+PiAyLjIwLjEK
Pj4+Cj4+Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPj4+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4Cj4+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
