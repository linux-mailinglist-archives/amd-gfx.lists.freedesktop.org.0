Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1931B38E7
	for <lists+amd-gfx@lfdr.de>; Wed, 22 Apr 2020 09:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B216E348;
	Wed, 22 Apr 2020 07:27:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749B26E342;
 Wed, 22 Apr 2020 07:27:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTsF/Qxw3vYTQ9s/pTYAbZqanaQ/vfBFbjc2P9KV0MyW8wL8epXS5/tb0HH52Wnru1Htv3/XBYV16ptYmJbqbxoWKGO33wkVw7gSwsNX/eUi/XQ4NZWCaWyrffGvMx6B/Vq0tWyWidnM+5A5AEcKtu50B9jqVxY/QP6jgSUq40grjnNBTIxn7Bt6sOjgqBqCJoi2y4VIU51Kk02C/3AOSppQVdJmAuHgK9Vuxop4N536YGR5qP8mlKS6f53IFX9DaLD/lL9PHP7inSZxkAmcZEusr8wig+3RtvSMZ3ryW9RZmvl9oSnA1eaR74AZzecJ+V+bi0+tOkFLu63jfBZGvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2Hu4fnHgrIBo9bMY+tgFFyQLMP9QTTdpstcbGSqg9E=;
 b=ME326Ekz0nadyj/Cp6wXcfZgY2sw8QXf39pcueK6lLlzSQ6eX4exv9vSvoANOM7XEIGnlVo6B1hXkiKC/Cvf4G6X4xhirt14bCrGxRywPLR/ZSuhTqHSqSScRiqz3cq6GASUqh8/3b7vzC88HK3YriurH6+rMSMslkTy+qzfFFbFf8AOli7g/KVF0F+L3s4hzYw3m1TV7UzmJRWVB55tXX0xWkcwSGeRGDqfZaRYy6FGxr3GLRpfHUs8/9J3ZoQrI3gtlBMA+DDIl9JWO1cZjyXXADQdIIVKmrM7/vHVKinKKtyat28JzppRVBfQF2Vhj/lt0JoX25CfkxBp8V1A0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2Hu4fnHgrIBo9bMY+tgFFyQLMP9QTTdpstcbGSqg9E=;
 b=oAW0gxONI4ZZB41n2a44rFSyuU1qthItbklP7lrmnrUG2LqSaMF8LPZ3NISOeatHZultLELkNQzqPxNHzECftd96LDsq/SmBOwROms89p3cukc2fTjF3QdTWSEPbKNlcDXNjWWaQ+AoblEWPBS0HL+aySMihqk3Npyakr3zB/OY=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB2875.namprd12.prod.outlook.com (2603:10b6:5:15c::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Wed, 22 Apr
 2020 07:27:33 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.2921.030; Wed, 22 Apr 2020
 07:27:33 +0000
Subject: Re: [PATCH] amdgpu: fixes memleak issue when init failed
To: =?UTF-8?B?6LW15Yab5aWO?= <bernard@vivo.com>
References: <AKoA0wCVCNOygUrJso2wM4qv.3.1587516987209.Hmail.bernard@vivo.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <bbb231fc-228d-d22f-2922-4868ab5ddc80@amd.com>
Date: Wed, 22 Apr 2020 09:27:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <AKoA0wCVCNOygUrJso2wM4qv.3.1587516987209.Hmail.bernard@vivo.com>
Content-Language: en-US
X-ClientProxiedBy: AM5PR0502CA0019.eurprd05.prod.outlook.com
 (2603:10a6:203:91::29) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM5PR0502CA0019.eurprd05.prod.outlook.com (2603:10a6:203:91::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend
 Transport; Wed, 22 Apr 2020 07:27:30 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a453fcdf-1b50-410f-d6fc-08d7e68e9f5d
X-MS-TrafficTypeDiagnostic: DM6PR12MB2875:|DM6PR12MB2875:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB287541E9DB3B274C4282812583D20@DM6PR12MB2875.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 03818C953D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(39850400004)(376002)(396003)(346002)(366004)(136003)(31696002)(36756003)(478600001)(54906003)(52116002)(31686004)(316002)(6666004)(6486002)(2616005)(2906002)(66574012)(186003)(66476007)(16526019)(6916009)(66946007)(86362001)(53546011)(8936002)(5660300002)(66556008)(81156014)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cx2eg8ALbM09ACzzSBk/9TP2BqgdEORdig8gvTUT+G8wjYUjKGBNQXSQjvhD+UC6FUdWYk2GdxaVIp/e2YGojjjf3iPNyw0/u78fWzvt/eeAo/II9iDWiWb7HnLYMZ3rAU/XRyfM2ljAu56gMRcD94zt2vynwTFylNG0KXckr6mI4gneaAmY8ApgwJ9UXfYWQplxhouewGBQIL+l05jw6fA7ucb95yJnIWY9z9tBv7/tysPr+92b1WcU9Txadho/PFvuqPXwXhYrjJgP+fV8+JSzS8lyCueDeyvgH7930jDj4PPr2HVXObXUHcpg1UMnbC4OMRjo6eV1X6J263S65BObN8qXmSCiBvcXQlPWq6ZxW2umx02Mrfo5RCVDNTyoerDvRrjwvciUDorjj+1HqJi2OrHTm+HNdE09JbRQw2bSjdcViRLc5X6t4G3wC+cw
X-MS-Exchange-AntiSpam-MessageData: fZCtxmbFq0cTtYE+Lg1k7I7U2wCy+BHbCn5jHW0P0654sYATf8cc+hg3Omc4ZYer2+45/h+pXEsTJw0s/C1EKH+NNQJBbmrK91QtWqqwJPwsFo0a7LhloKMQyO3TlsugFqxS8MIPct/Bsz3oWjvyVlaXFpk98i0efsIatyng5THWL0Ra4yNeWJYxeHzPkvukSAq5yn2uFfaSJ5omGDs9RNp7VebJxnwZ1VmK6JBNojq88sqvZZ+1KTrimaUdbkCMRmSj025W9pAcwzLFdsYDjP/sibSixDE8h2Q18zgh49WP1dUXwF7xTHnQcmJ8OrxYOKrvVPRPIzHg4CGmD66XH3inH4qHZZEBZMHDIbALJd13Cutm1HLVDuYPKF8/XbHIvj7nLOCAIDY6Yv1pscpZmIJVFG7k+WTOghXFPxXFpgZaYg+CvTBk35oqG6Zw8SQdE1+ZQE8ec6gjrN68Qaw84OTA/6efVffN/bzU4wfe9J8dNss9S7i6ij9CwV1nQS+YbhkENb7gOf/509y1PwuKV1iCxe1N3bzYijUIbukiY3fdS4uNOrAVcmyDzggxfG5moZ3hud/8Stb1b+ipmJfaBUrjZputGnVUL2il8SDDO3Ul3DAMnEOJOeK6uxIuCendjgCc5zuwm/Miw8NcHwIS63F69+lns5Hvgis51Ud1auHf0FOCQcI9bcxp6IVKwU7N5gnzCyFJIUeVj943L8HxFI/Jecd2QJGaYxckGWEdalerUElGZCYPnxQEpjsv8nluuEkBQ65YE0jT/Rs2DyURhnbHNbze/4GdXFGLWkzFdcyr/XQIUW1+3zDKbkpETlBTTmjrcrQqll3et+UkjDQoEi9mETENJZH5r9WawtE+1bg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a453fcdf-1b50-410f-d6fc-08d7e68e9f5d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2020 07:27:33.1906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LKpbXvIzOVuxtvyYCEQKEBMn3SAjKYjj6NenpKH38RO8EaPHToRlLI8vrOlzosBm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2875
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
Cc: Tom St Denis <tom.stdenis@amd.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Ori Messinger <Ori.Messinger@amd.com>, opensource.kernel@vivo.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjIuMDQuMjAgdW0gMDI6NTYgc2NocmllYiDotbXlhpvlpY46Cj4g5Y+R5Lu25Lq677yaIkNo
cmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4g5Y+R6YCB5pel5pyf
77yaMjAyMC0wNC0yMSAyMjo1Mzo0Nwo+IOaUtuS7tuS6uu+8miLotbXlhpvlpY4iIDxiZXJuYXJk
QHZpdm8uY29tPgo+IOaKhOmAgeS6uu+8mkFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJA
YW1kLmNvbT4sIkRhdmlkIChDaHVuTWluZykgWmhvdSIgPERhdmlkMS5aaG91QGFtZC5jb20+LERh
dmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4sRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPixUb20gU3QgRGVuaXMgPHRvbS5zdGRlbmlzQGFtZC5jb20+LE9yaSBNZXNzaW5nZXIgPE9y
aS5NZXNzaW5nZXJAYW1kLmNvbT4sU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPixhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyxkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
LGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcsb3BlbnNvdXJjZS5rZXJuZWxAdml2by5jb20K
PiDkuLvpopjvvJpSZTogW1BBVENIXSBhbWRncHU6IGZpeGVzIG1lbWxlYWsgaXNzdWUgd2hlbiBp
bml0IGZhaWxlZD5BbSAyMS4wNC4yMCB1bSAxNTozOSBzY2hyaWViIOi1teWGm+WljjoKPj4+IOWP
keS7tuS6uu+8miJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+
Pj4g5Y+R6YCB5pel5pyf77yaMjAyMC0wNC0yMSAyMTowMjoyNwo+Pj4g5pS25Lu25Lq677yaIui1
teWGm+WljiIgPGJlcm5hcmRAdml2by5jb20+Cj4+PiDmioTpgIHkurrvvJpBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+LCJEYXZpZCAoQ2h1bk1pbmcpIFpob3UiIDxEYXZp
ZDEuWmhvdUBhbWQuY29tPixEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+LERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4sVG9tIFN0IERlbmlzIDx0b20uc3RkZW5pc0BhbWQuY29t
PixPcmkgTWVzc2luZ2VyIDxPcmkuTWVzc2luZ2VyQGFtZC5jb20+LFNhbSBSYXZuYm9yZyA8c2Ft
QHJhdm5ib3JnLm9yZz4sYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcsZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZyxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnLG9wZW5zb3Vy
Y2Uua2VybmVsQHZpdm8uY29tCj4+PiDkuLvpopjvvJpSZTogW1BBVENIXSBhbWRncHU6IGZpeGVz
IG1lbWxlYWsgaXNzdWUgd2hlbiBpbml0IGZhaWxlZD5BbSAyMS4wNC4yMCB1bSAxNDowOSBzY2hy
aWViIOi1teWGm+WljjoKPj4+Pj4gRnJvbTogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+Cj4+Pj4+IERhdGU6IDIwMjAtMDQtMjEgMTk6MjI6NDkKPj4+Pj4gVG86
ICBCZXJuYXJkIFpoYW8gPGJlcm5hcmRAdml2by5jb20+LEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4sIkRhdmlkIChDaHVuTWluZykgWmhvdSIgPERhdmlkMS5aaG91QGFt
ZC5jb20+LERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4sRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPixUb20gU3QgRGVuaXMgPHRvbS5zdGRlbmlzQGFtZC5jb20+LE9yaSBNZXNz
aW5nZXIgPE9yaS5NZXNzaW5nZXJAYW1kLmNvbT4sU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPixhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyxkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnLGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPj4+Pj4gQ2M6ICBvcGVuc291
cmNlLmtlcm5lbEB2aXZvLmNvbQo+Pj4+PiBTdWJqZWN0OiBSZTogW1BBVENIXSBhbWRncHU6IGZp
eGVzIG1lbWxlYWsgaXNzdWUgd2hlbiBpbml0IGZhaWxlZD5BbSAyMS4wNC4yMCB1bSAxMzoxNyBz
Y2hyaWViIEJlcm5hcmQgWmhhbzoKPj4+Pj4+PiBWUkFNIG1hbmFnZXIgYW5kIERSTSBNTSB3aGVu
IGluaXQgZmFpbGVkLCB0aGVyZSBpcyBubyBvcGVyYWN0aW9uCj4+Pj4+Pj4gdG8gZnJlZSBremFs
bG9jIG1lbW9yeSAmIHJlbW92ZSBkZXZpY2UgZmlsZS4KPj4+Pj4+PiBUaGlzIHdpbGwgbGVhZCB0
byBtZW1sZWFrICYgY2F1c2Ugc3RhYmlsaXR5IGlzc3VlLgo+Pj4+Pj4gTkFLLCBmYWlsdXJlIHRv
IGNyZWF0ZSBzeXNmcyBub2RlcyBhcmUgbm90IGNyaXRpY2FsLgo+Pj4+Pj4KPj4+Pj4+IENocmlz
dGlhbi4KPj4+Pj4+Cj4+Pj4+IE9LLCBnZXQgaXQuCj4+Pj4+IEJ5IHRoZSB3YXksIHNob3VsZCBp
IG1vZGlmeSB0aGlzIHBhdGNoIHRvIGp1c3QgaGFuZGxlIDxrZnJlZShtZ3IpPiBpbiBlcnJvciBi
cmFuY2gsIG9yIHRoYXQgaXQgaXMgYWxzbyB1bm5lY2Vzc2FyeT8KPj4+PiBXaGF0IHlvdSBjYW4g
ZG8gaXMgdG8gZHJvcCB0aGUgInJldHVybiByZXQiIGlmIGFueXRoaW5nIHdpdGggdGhlIHN5c2Zz
Cj4+Pj4gbm9kZXMgZ29lcyB3cm9uZyBhbmQgaW5zdGVhZCBwcmludCB0aGUgZXJyb3IgY29kZS4K
Pj4+IEVtbW0sIGZvciB0aGlzIHBhcnQsIGkgYW0gbm90IHN1cmUsIG15IG1vZGlmeSBmaXJzdCBw
cmludCB0aGUgZXJyb3IsIHNlY29uZSByZWxlYXNlIG5vdCBmcmVlIG1lbW9yeSwKPj4+IGFuZCBs
YXN0IHJldHVybiBlcnJvciwgbWFrZSBldmVyeXRoaW5nIGNsZWFyIHRvIHRoZSBzeXN0ZW0uCj4+
PiBJIHRoaW5rIGl0YHMgdGhlIHNhbWUgd2l0aCB3aGF0IHlvdSBtZW50aW9uZWQsIGlzIHRoZXJl
IHNvbWV0aGluZyB0aGF0IEkgbWlzdW5kZXJzdG9vZD8KPj4gWWVzLCBtYXliZSBhbiBleGFtcGxl
IG1ha2VzIGl0IG1vcmUgY2xlYXIgd2hhdCB0byBkbyBoZXJlLiBDdXJyZW50bHkgd2UKPj4gcHJp
bnQgYW5kIGVycm9yIGFuZCByZXR1cm4gd2hlbiBzb21ldGhpbmcgd2l0aCB0aGUgc3lzZnMgZmls
ZXMgZ29lcyB3cm9uZzoKPj4KPj4gaWYgKHJldCkgewo+PiAgwqDCoMKgIERSTV9FUlJPUigiRmFp
bGVkIHRvIGNyZWF0ZSBkZXZpY2UgZmlsZSBtZW1faW5mb192cmFtX3RvdGFsXG4iKTsKPj4gIMKg
wqDCoCByZXR1cm4gcmV0Owo+PiB9Cj4+Cj4+IEJ1dCB3aGF0IHdlIHNob3VsZCBkbyBpbnN0ZWFk
IGlzIGp1c3QgdG8gcHJpbnQgYW4gZXJyb3IgYW5kIGNvbnRpbnVlIGFuZAo+PiBpbiB0aGUgZW5k
IHJldHVybiBzdWNjZXNzIHN0YXR1czoKPj4KPj4gaWYgKHJldCkKPj4gIMKgwqDCoCBEUk1fRVJS
T1IoIkZhaWxlZCB0byBjcmVhdGUgZGV2aWNlIGZpbGUgbWVtX2luZm9fdnJhbV90b3RhbAo+PiAo
JWQpXG4iLCByKTsKPj4KPj4gLi4uCj4+IHJldHVybiAwOwo+Pgo+PiBSZWdhcmRzLAo+PiBDaHJp
c3RpYW4uCj4+Cj4gRW1tbSwgIGkgYW0gc3RpbGwgY29uZnVzZWQgYWJvdXQgdHdvIHBvaW50czoK
PiAxIERvZXMgdGhhdCBtZWFuIHRoZXJlIGlzIG5vIGZhaWxlZCBjYXNlIGluIHRoaXMgZnVuY3Rp
b24/CgpXZWxsIHRoZSBremFsbG9jIGNhbiBzdGlsbCBmYWlsLgoKPiAyIFRoZXJlIGlzIG5vIG5l
ZWQgdG8gZnJlZSB0aGUga3ptYWxsb2Mgc3BhY2Uobm8gcG9zc2liaWxpdHkgb2YgbWVtb3J5IGxl
YWsgKT8KCkNvcnJlY3QsIHllcy4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCj4KPiBSZWdhcmRzLAo+
IEJlcm5hcmQKPgo+Pj4+IEl0J3MgcmVhbGx5IGFubm95aW5nIHRoYXQgbG9hZGluZywgdW5sb2Fk
aW5nIGFuZCBsb2FkaW5nIHRoZSBkcml2ZXIKPj4+PiBhZ2FpbiBzb21ldGltZXMgZmFpbHMgYmVj
YXVzZSB3ZSBoYXZlIGEgYnVnIGluIHRoZSBzeXNmcyBmaWxlcyBjbGVhbnVwLgo+Pj4+Cj4+Pj4g
V2UgY2VydGFpbmx5IHNob3VsZCBmaXggdGhvc2UgYnVncyBhcyB3ZWxsLCBidXQgdGhleSBhcmUg
anVzdCBub3QKPj4+PiBjcml0aWNhbCBmb3IgY29ycmVjdCBkcml2ZXIgZnVuY3Rpb25hbGl0eS4K
Pj4+Pgo+Pj4+IFJlZ2FyZHMsCj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+PiBSZWdhcmRzLAo+Pj4+PiBC
ZXJuYXJkCj4+Pj4+Cj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQmVybmFyZCBaaGFvIDxiZXJuYXJk
QHZpdm8uY29tPgo+Pj4+Pj4+IC0tLQo+Pj4+Pj4+ICAgICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMgfCAyNCArKysrKysrKysrKysrKysrLS0tLQo+Pj4+Pj4+
ICAgICAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+
Pj4+Pj4KPj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3ZyYW1fbWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9t
Z3IuYwo+Pj4+Pj4+IGluZGV4IDgyYTMyOTllNTNjMC4uNGM1ZmIxNTNlNmI0IDEwMDY0NAo+Pj4+
Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jCj4+
Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMK
Pj4+Pj4+PiBAQCAtMTc1LDMwICsxNzUsNDQgQEAgc3RhdGljIGludCBhbWRncHVfdnJhbV9tZ3Jf
aW5pdChzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwKPj4+Pj4+PiAgICAgIAlyZXQg
PSBkZXZpY2VfY3JlYXRlX2ZpbGUoYWRldi0+ZGV2LCAmZGV2X2F0dHJfbWVtX2luZm9fdnJhbV90
b3RhbCk7Cj4+Pj4+Pj4gICAgICAJaWYgKHJldCkgewo+Pj4+Pj4+ICAgICAgCQlEUk1fRVJST1Io
IkZhaWxlZCB0byBjcmVhdGUgZGV2aWNlIGZpbGUgbWVtX2luZm9fdnJhbV90b3RhbFxuIik7Cj4+
Pj4+Pj4gLQkJcmV0dXJuIHJldDsKPj4+Pj4+PiArCQlnb3RvIFZSQU1fVE9UQUxfRkFJTDsKPj4+
Pj4+PiAgICAgIAl9Cj4+Pj4+Pj4gICAgICAJcmV0ID0gZGV2aWNlX2NyZWF0ZV9maWxlKGFkZXYt
PmRldiwgJmRldl9hdHRyX21lbV9pbmZvX3Zpc192cmFtX3RvdGFsKTsKPj4+Pj4+PiAgICAgIAlp
ZiAocmV0KSB7Cj4+Pj4+Pj4gICAgICAJCURSTV9FUlJPUigiRmFpbGVkIHRvIGNyZWF0ZSBkZXZp
Y2UgZmlsZSBtZW1faW5mb192aXNfdnJhbV90b3RhbFxuIik7Cj4+Pj4+Pj4gLQkJcmV0dXJuIHJl
dDsKPj4+Pj4+PiArCQlnb3RvIFZJU19WUkFNX1RPVEFfRkFJTDsKPj4+Pj4+PiAgICAgIAl9Cj4+
Pj4+Pj4gICAgICAJcmV0ID0gZGV2aWNlX2NyZWF0ZV9maWxlKGFkZXYtPmRldiwgJmRldl9hdHRy
X21lbV9pbmZvX3ZyYW1fdXNlZCk7Cj4+Pj4+Pj4gICAgICAJaWYgKHJldCkgewo+Pj4+Pj4+ICAg
ICAgCQlEUk1fRVJST1IoIkZhaWxlZCB0byBjcmVhdGUgZGV2aWNlIGZpbGUgbWVtX2luZm9fdnJh
bV91c2VkXG4iKTsKPj4+Pj4+PiAtCQlyZXR1cm4gcmV0Owo+Pj4+Pj4+ICsJCWdvdG8gVlJBTV9V
U0VEX0ZBSUw7Cj4+Pj4+Pj4gICAgICAJfQo+Pj4+Pj4+ICAgICAgCXJldCA9IGRldmljZV9jcmVh
dGVfZmlsZShhZGV2LT5kZXYsICZkZXZfYXR0cl9tZW1faW5mb192aXNfdnJhbV91c2VkKTsKPj4+
Pj4+PiAgICAgIAlpZiAocmV0KSB7Cj4+Pj4+Pj4gICAgICAJCURSTV9FUlJPUigiRmFpbGVkIHRv
IGNyZWF0ZSBkZXZpY2UgZmlsZSBtZW1faW5mb192aXNfdnJhbV91c2VkXG4iKTsKPj4+Pj4+PiAt
CQlyZXR1cm4gcmV0Owo+Pj4+Pj4+ICsJCWdvdG8gVklTX1ZSQU1fVVNFRF9GQUlMOwo+Pj4+Pj4+
ICAgICAgCX0KPj4+Pj4+PiAgICAgIAlyZXQgPSBkZXZpY2VfY3JlYXRlX2ZpbGUoYWRldi0+ZGV2
LCAmZGV2X2F0dHJfbWVtX2luZm9fdnJhbV92ZW5kb3IpOwo+Pj4+Pj4+ICAgICAgCWlmIChyZXQp
IHsKPj4+Pj4+PiAgICAgIAkJRFJNX0VSUk9SKCJGYWlsZWQgdG8gY3JlYXRlIGRldmljZSBmaWxl
IG1lbV9pbmZvX3ZyYW1fdmVuZG9yXG4iKTsKPj4+Pj4+PiAtCQlyZXR1cm4gcmV0Owo+Pj4+Pj4+
ICsJCWdvdG8gVlJBTV9WRVJET1JfRkFJTDsKPj4+Pj4+PiAgICAgIAl9Cj4+Pj4+Pj4gICAgICAK
Pj4+Pj4+PiAgICAgIAlyZXR1cm4gMDsKPj4+Pj4+PiArCj4+Pj4+Pj4gK1ZSQU1fVkVSRE9SX0ZB
SUw6Cj4+Pj4+Pj4gKwlkZXZpY2VfcmVtb3ZlX2ZpbGUoYWRldi0+ZGV2LCAmZGV2X2F0dHJfbWVt
X2luZm9fdmlzX3ZyYW1fdXNlZCk7Cj4+Pj4+Pj4gK1ZJU19WUkFNX1VTRURfRkFJTDoKPj4+Pj4+
PiArCWRldmljZV9yZW1vdmVfZmlsZShhZGV2LT5kZXYsICZkZXZfYXR0cl9tZW1faW5mb192cmFt
X3VzZWQpOwo+Pj4+Pj4+ICtSVkFNX1VTRURfRkFJTDoKPj4+Pj4+PiArCWRldmljZV9yZW1vdmVf
ZmlsZShhZGV2LT5kZXYsICZkZXZfYXR0cl9tZW1faW5mb192aXNfdnJhbV90b3RhbCk7Cj4+Pj4+
Pj4gK1ZJU19WUkFNX1RPVEFfRkFJTDoKPj4+Pj4+PiArCWRldmljZV9yZW1vdmVfZmlsZShhZGV2
LT5kZXYsICZkZXZfYXR0cl9tZW1faW5mb192cmFtX3RvdGFsKTsKPj4+Pj4+PiArVlJBTV9UT1RB
TF9GQUlMOgo+Pj4+Pj4+ICsJa2ZyZWUobWdyKTsKPj4+Pj4+PiArCW1hbi0+cHJpdiA9IE5VTEw7
Cj4+Pj4+Pj4gKwo+Pj4+Pj4+ICsJcmV0dXJuIHJldDsKPj4+Pj4+PiAgICAgIH0KPj4+Pj4+PiAg
ICAgIAo+Pj4+Pj4+ICAgICAgLyoqCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeAo=
