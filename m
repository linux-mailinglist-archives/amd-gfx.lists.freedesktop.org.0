Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C3F14542D
	for <lists+amd-gfx@lfdr.de>; Wed, 22 Jan 2020 13:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E88276F4D9;
	Wed, 22 Jan 2020 12:01:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2821F6F4D9
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 Jan 2020 12:01:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYI4yO9XePB1FLuApaX7aBNV20nF8uBoXUnnk1Zt+Rhe5XG6XFiUZ6Hvj6UvvfpAKxMYsgofl8IqeDIhnGDaJbrKrqQpS3PjRrPzG2xcuhDIu8WxBY3nJ5dcd+aeWw0czrjwc1vLv1jAhvx6IJRhGT1uVNCypFJPCu4aDQ9DPPNxpZVvtY1bG8o+1VqK4MAWl+hhAhSVPuAxsT2Ic+QrnD1w5DdnZvCd8Ge0+ATlhJRyYk8addpm/T1NfIhKjEXRr+Wu6oooolALyUBdFJ06VpZxOnvoleEJZbowuZXb/lfjQRnIv35TPyv9J/GVfRuOb1XbeCfMCcsgisSy7UfJZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKHfACtlbnle0l7JmdqQ8fJwAcOxbdzG++/C44SdvO4=;
 b=PVZHZ4kBnDTVPTY2j7hXepiGPXssg5kSfINZZL6q+QxRpREaFwoOvxcSMiNbf6f2s6odqfFTchbkVqs+vkHCF9LXbkicgTocX1FeiNCtlSMJyHJmnTnWdKS5VivhK1f+obDyEigEOHeC1OJjBbejXWy4ZuHgA9br86Xc0aXEg6zsIpqHAdGI2pTgATh3LFrp+uBw5MDL9tljyjQBQoiwZWXJ4YFoRjXZLq7EO8jTjGVZfgmHjYWKNexjMIJJJJqvs8aJsN1PYO6lbBZ/6ZH5GU+N4TYv25jNOa5Y7m30Hzxk5SCtph06pvUIOb5mGWsEbVfg0xy2AaGlbb2WpJ9PKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKHfACtlbnle0l7JmdqQ8fJwAcOxbdzG++/C44SdvO4=;
 b=txdfA7mKTIdf8g5rJn9i6sxzsMXwS+a/SRBeq8dC6cxT6MY0bPROYwvGi/DSNJt4YcHLejQjLyhH/0Vqsz3z05Upd9R9T7OIcsk/BKrCjx2+Ym24Mu949+Zq5BelgBfesUAqBP/oVOM9NKuR+pDhktY2aH28E2oGmK2T5QeO/fU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nirmoy.Das@amd.com; 
Received: from DM5PR12MB2376.namprd12.prod.outlook.com (52.132.143.139) by
 DM5PR12MB2550.namprd12.prod.outlook.com (52.132.143.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.19; Wed, 22 Jan 2020 12:01:45 +0000
Received: from DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::c06c:24da:d4c5:5ee3]) by DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::c06c:24da:d4c5:5ee3%6]) with mapi id 15.20.2644.028; Wed, 22 Jan 2020
 12:01:45 +0000
Subject: Re: [PATCH 2/2] drm/amdgpu: allocate entities on demand
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>, amd-gfx@lists.freedesktop.org
References: <20200122093306.16737-1-nirmoy.das@amd.com>
 <20200122093306.16737-2-nirmoy.das@amd.com>
 <02056911-7742-c518-7e12-5b56c149cdee@amd.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <24b27121-e2fd-5371-7dd9-27af5ce8a153@amd.com>
Date: Wed, 22 Jan 2020 13:03:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
In-Reply-To: <02056911-7742-c518-7e12-5b56c149cdee@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR06CA0030.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::43) To DM5PR12MB2376.namprd12.prod.outlook.com
 (2603:10b6:4:b9::11)
MIME-Version: 1.0
Received: from [IPv6:2003:c5:8f29:5700:a0f:1fdb:bc5b:14d8]
 (2003:c5:8f29:5700:a0f:1fdb:bc5b:14d8) by
 AM0PR06CA0030.eurprd06.prod.outlook.com (2603:10a6:208:ab::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.19 via Frontend Transport; Wed, 22 Jan 2020 12:01:43 +0000
X-Originating-IP: [2003:c5:8f29:5700:a0f:1fdb:bc5b:14d8]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bd87a865-427b-46a6-b09f-08d79f32d9c2
X-MS-TrafficTypeDiagnostic: DM5PR12MB2550:|DM5PR12MB2550:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB2550B72B606433F03A24D7AA8B0C0@DM5PR12MB2550.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 029097202E
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(376002)(346002)(396003)(136003)(189003)(199004)(66476007)(66556008)(31696002)(66946007)(52116002)(8676002)(81156014)(31686004)(8936002)(6486002)(81166006)(478600001)(36756003)(2906002)(5660300002)(2616005)(4326008)(186003)(110136005)(53546011)(66574012)(6666004)(316002)(16526019);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2550;
 H:DM5PR12MB2376.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wef5vCJX73Tu6Y3v6vu08j5M2yIUkwkz5fOmLZknQhR4+y6nDdg5dQ04dzFIYr4lSliIWoVqZFVwgrs3s4c9WWASg51QQPWU6og1HD2tIkk/QdwR7JnwTrSSdd6XmtT+rlBI/Bd74bF+RjHEHLE9SdMlqAErd1uifZJt/rakFoQxZg0uWRBaRg8KWZCbLNZCSsuMaFnn7SmHaq+4xmzC4RXdJPKpDiVog2PAhiDWcCbSyCalDwYoDdAHSJHRxNZWU+I416gvbKR0GI+R8PGTh9CXoEjLttom3aurpKLO9ij5InnBbftzxMX7rxe3YxYbq6ZJGZWJOiO9xixgT7KOf0pF0qYNkRT3hc+pIWf3ePqxyQAnC5cw1XsU4reXwQj3iJF2YVHJxnMY+IETCfk5u2M9yQ9IWewBpnR+WZZfEqVW4cVtpj4pgFzO4PdEHKyj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd87a865-427b-46a6-b09f-08d79f32d9c2
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2020 12:01:44.9918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V8ImHeLOz79YdvNAgjTlIjrnvnNDccp40FpPICTvAhSjrPdBt5WiPLzHbZyIyzJ089gBb91KNPvw0RKxNH8o7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2550
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
Cc: alexander.deucher@amd.com, kenny.ho@amd.com, nirmoy.das@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Ck9uIDEvMjIvMjAgMTI6MzkgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMjIuMDEu
MjAgdW0gMTA6MzMgc2NocmllYiBOaXJtb3kgRGFzOgo+PiBDdXJyZW50bHkgd2UgcHJlLWFsbG9j
YXRlIGVudGl0aWVzIGFuZCBmZW5jZXMgZm9yIGFsbCB0aGUgSFcgSVBzIG9uCj4+IGNvbnRleHQg
Y3JlYXRpb24gYW5kIHNvbWUgb2Ygd2hpY2ggYXJlIG1pZ2h0IG5ldmVyIGJlIHVzZWQuCj4+Cj4+
IFRoaXMgcGF0Y2ggdHJpZXMgdG8gcmVzb2x2ZSBlbnRpdHkvZmVuY2VzIHdhc3RhZ2UgYnkgY3Jl
YXRpbmcgZW50aXRpZXMKPj4gZm9yIGEgSFcgSVAgb25seSB3aGVuIGl0IGlzIHJlcXVpcmVkLgo+
Pgo+PiB2MjogY29uc29saWRhdGVkIHByaW9yaXR5IGNoZWNraW5nIGF0IGFtZGdwdV9jdHhfcHJp
b3JpdHlfcGVybWl0KCkKPgo+IFdlbGwgdGhhdCBpcyBub3QgcmVhbGx5IHdoYXQgSSBoYWQgaW4g
bWluZC4gU2VlIGFsbW9zdCBhbGwgCj4gYXBwbGljYXRpb25zIHVzZSBvbmx5IHRoZSBmaXJzdCBp
bnN0YW5jZSBvZiBhIGh3X2lwLgo+Cj4gU28gd2hhdCB3ZSBzaG91bGQgcHJvYmFibHkgZG8gYWxs
b2NhdGUgZW50aXRpZXMgb24gZGVtYW5kIGluc3RlYWQgb2YgCj4gd2hvbGUgaHdfaXBzLgo+Cj4g
RG8geW91IGtub3cgd2hhdCBJIG1lYW4/CgpPa2F5IEkgdW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFu
LiBJIHdpbGwgcmV3b3JrIHRoaXMgYW5kIGdldCBiYWNrIHRvIHlvdS4KCgpSZWdhcmRzLAoKTmly
bW95Cgo+Cj4gUmVnYXJkcywKPiBDaHJpc3RpYW4uCj4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTmly
bW95IERhcyA8bmlybW95LmRhc0BhbWQuY29tPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5jIHwgMTYwICsrKysrKysrKysrKystLS0tLS0tLS0tLQo+
PiDCoCAxIGZpbGUgY2hhbmdlZCwgODcgaW5zZXJ0aW9ucygrKSwgNzMgZGVsZXRpb25zKC0pCj4+
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMg
Cj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5jCj4+IGluZGV4IGVl
Y2JkNjhkYjk4Ni4uZDcwNGUxYmViYjFiIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfY3R4LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2N0eC5jCj4+IEBAIC00NSw2ICs0NSw5IEBAIGNvbnN0IHVuc2lnbmVkIGludCAK
Pj4gYW1kZ3B1X2N0eF9udW1fZW50aXRpZXNbQU1ER1BVX0hXX0lQX05VTV0gPSB7Cj4+IMKgIHN0
YXRpYyBpbnQgYW1kZ3B1X2N0eF9wcmlvcml0eV9wZXJtaXQoc3RydWN0IGRybV9maWxlICpmaWxw
LAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVudW0g
ZHJtX3NjaGVkX3ByaW9yaXR5IHByaW9yaXR5KQo+PiDCoCB7Cj4+ICvCoMKgwqAgaWYgKHByaW9y
aXR5IDwgMCB8fCBwcmlvcml0eSA+PSBEUk1fU0NIRURfUFJJT1JJVFlfTUFYKQo+PiArwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+ICsKPj4gwqDCoMKgwqDCoCAvKiBOT1JNQUwgYW5k
IGJlbG93IGFyZSBhY2Nlc3NpYmxlIGJ5IGV2ZXJ5b25lICovCj4+IMKgwqDCoMKgwqAgaWYgKHBy
aW9yaXR5IDw9IERSTV9TQ0hFRF9QUklPUklUWV9OT1JNQUwpCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCByZXR1cm4gMDsKPj4gQEAgLTU4LDY1ICs2MSwzNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9jdHhf
cHJpb3JpdHlfcGVybWl0KHN0cnVjdCAKPj4gZHJtX2ZpbGUgKmZpbHAsCj4+IMKgwqDCoMKgwqAg
cmV0dXJuIC1FQUNDRVM7Cj4+IMKgIH0KPj4gwqAgLXN0YXRpYyBpbnQgYW1kZ3B1X2N0eF9pbml0
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBlbnVtIGRybV9zY2hlZF9wcmlvcml0eSBwcmlvcml0eSwKPj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9maWxlICpmaWxwLAo+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzdHJ1Y3QgYW1kZ3B1X2N0eCAqY3R4KQo+PiArc3RhdGljIGludCBhbWRn
cHVfY3R4X2luaXRfZW50aXR5KHN0cnVjdCBhbWRncHVfY3R4ICpjdHgsIGNvbnN0IHUzMiAKPj4g
aHdfaXApCj4+IMKgIHsKPj4gLcKgwqDCoCB1bnNpZ25lZCBpLCBqOwo+PiAtwqDCoMKgIGludCBy
Owo+PiArwqDCoMKgIHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gY3R4LT5hZGV2Owo+PiAr
wqDCoMKgIHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqKnNjaGVkczsKPj4gK8KgwqDCoCBzdHJ1
Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkOwo+PiArwqDCoMKgIHVuc2lnbmVkIG51bV9zY2hl
ZHMgPSAwOwo+PiArwqDCoMKgIGVudW0gZHJtX3NjaGVkX3ByaW9yaXR5IHByaW9yaXR5Owo+PiAr
wqDCoMKgIGludCBqLCByOwo+PiDCoCAtwqDCoMKgIGlmIChwcmlvcml0eSA8IDAgfHwgcHJpb3Jp
dHkgPj0gRFJNX1NDSEVEX1BSSU9SSVRZX01BWCkKPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiAt
RUlOVkFMOwo+PiArwqDCoMKgIGN0eC0+ZW50aXRpZXNbaHdfaXBdID0ga2NhbGxvYyhhbWRncHVf
Y3R4X251bV9lbnRpdGllc1tod19pcF0sCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzaXplb2Yoc3RydWN0IGFtZGdwdV9jdHhfZW50aXR5KSwgR0ZQX0tF
Uk5FTCk7Cj4+IMKgIC3CoMKgwqAgciA9IGFtZGdwdV9jdHhfcHJpb3JpdHlfcGVybWl0KGZpbHAs
IHByaW9yaXR5KTsKPj4gLcKgwqDCoCBpZiAocikKPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiBy
Owo+PiArwqDCoMKgIGlmICghY3R4LT5lbnRpdGllc1tod19pcF0pCj4+ICvCoMKgwqDCoMKgwqDC
oCByZXR1cm7CoCAtRU5PTUVNOwo+PiDCoCAtwqDCoMKgIG1lbXNldChjdHgsIDAsIHNpemVvZigq
Y3R4KSk7Cj4+IC3CoMKgwqAgY3R4LT5hZGV2ID0gYWRldjsKPj4gK8KgwqDCoCBmb3IgKGogPSAw
OyBqIDwgYW1kZ3B1X2N0eF9udW1fZW50aXRpZXNbaHdfaXBdOyArK2opIHsKPj4gwqAgLcKgwqDC
oCBmb3IgKGkgPSAwOyBpIDwgQU1ER1BVX0hXX0lQX05VTTsgKytpKSB7Cj4+IC3CoMKgwqDCoMKg
wqDCoCBjdHgtPmVudGl0aWVzW2ldID0ga2NhbGxvYyhhbWRncHVfY3R4X251bV9lbnRpdGllc1tp
XSwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNpemVv
ZihzdHJ1Y3QgYW1kZ3B1X2N0eF9lbnRpdHkpLAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgR0ZQX0tFUk5FTCk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBzdHJ1
Y3QgYW1kZ3B1X2N0eF9lbnRpdHkgKmVudGl0eSA9ICZjdHgtPmVudGl0aWVzW2h3X2lwXVtqXTsK
Pj4gwqAgLcKgwqDCoMKgwqDCoMKgIGlmICghY3R4LT5lbnRpdGllc1swXSkgewo+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByID3CoCAtRU5PTUVNOwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBnb3RvIGVycm9yX2NsZWFudXBfZW50aXR5X21lbW9yeTsKPj4gK8KgwqDCoMKgwqDCoMKgIGVu
dGl0eS0+c2VxdWVuY2UgPSAxOwo+PiArwqDCoMKgwqDCoMKgwqAgZW50aXR5LT5mZW5jZXMgPSBr
Y2FsbG9jKGFtZGdwdV9zY2hlZF9qb2JzLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzaXplb2Yoc3RydWN0IGRtYV9mZW5jZSopLCBHRlBfS0VSTkVMKTsKPj4g
K8KgwqDCoMKgwqDCoMKgIGlmICghZW50aXR5LT5mZW5jZXMpIHsKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgciA9IC1FTk9NRU07Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJy
b3JfY2xlYW51cF9tZW1vcnk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+IMKgwqDCoMKgwqAg
fQo+PiDCoCAtwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBBTURHUFVfSFdfSVBfTlVNOyArK2kpIHsK
Pj4gLcKgwqDCoMKgwqDCoMKgIGZvciAoaiA9IDA7IGogPCBhbWRncHVfY3R4X251bV9lbnRpdGll
c1tpXTsgKytqKSB7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfY3R4
X2VudGl0eSAqZW50aXR5ID0gJmN0eC0+ZW50aXRpZXNbaV1bal07Cj4+IC0KPj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZW50aXR5LT5zZXF1ZW5jZSA9IDE7Cj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGVudGl0eS0+ZmVuY2VzID0ga2NhbGxvYyhhbWRncHVfc2NoZWRfam9icywKPj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplb2Yoc3Ry
dWN0IGRtYV9mZW5jZSopLCBHRlBfS0VSTkVMKTsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aWYgKCFlbnRpdHktPmZlbmNlcykgewo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHIgPSAtRU5PTUVNOwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJy
b3JfY2xlYW51cF9tZW1vcnk7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gLcKgwqDC
oMKgwqDCoMKgIH0KPj4gLcKgwqDCoCB9Cj4+IC0KPj4gLcKgwqDCoCBrcmVmX2luaXQoJmN0eC0+
cmVmY291bnQpOwo+PiAtwqDCoMKgIHNwaW5fbG9ja19pbml0KCZjdHgtPnJpbmdfbG9jayk7Cj4+
IC3CoMKgwqAgbXV0ZXhfaW5pdCgmY3R4LT5sb2NrKTsKPj4gLQo+PiAtwqDCoMKgIGN0eC0+cmVz
ZXRfY291bnRlciA9IGF0b21pY19yZWFkKCZhZGV2LT5ncHVfcmVzZXRfY291bnRlcik7Cj4+IC3C
oMKgwqAgY3R4LT5yZXNldF9jb3VudGVyX3F1ZXJ5ID0gY3R4LT5yZXNldF9jb3VudGVyOwo+PiAt
wqDCoMKgIGN0eC0+dnJhbV9sb3N0X2NvdW50ZXIgPSBhdG9taWNfcmVhZCgmYWRldi0+dnJhbV9s
b3N0X2NvdW50ZXIpOwo+PiAtwqDCoMKgIGN0eC0+aW5pdF9wcmlvcml0eSA9IHByaW9yaXR5Owo+
PiAtwqDCoMKgIGN0eC0+b3ZlcnJpZGVfcHJpb3JpdHkgPSBEUk1fU0NIRURfUFJJT1JJVFlfVU5T
RVQ7Cj4+IC0KPj4gLcKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgQU1ER1BVX0hXX0lQX05VTTsgKytp
KSB7Cj4+IC3CoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKipzY2hlZHM7
Cj4+IC3CoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkOwo+PiAt
wqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbnVtX3NjaGVkcyA9IDA7Cj4+IC0KPj4gLcKgwqDCoMKg
wqDCoMKgIHN3aXRjaCAoaSkgewo+PiArwqDCoMKgIHByaW9yaXR5ID0gKGN0eC0+b3ZlcnJpZGVf
cHJpb3JpdHkgPT0gRFJNX1NDSEVEX1BSSU9SSVRZX1VOU0VUKSA/Cj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgY3R4LT5pbml0X3ByaW9yaXR5IDogY3R4LT5vdmVycmlkZV9wcmlv
cml0eTsKPj4gK8KgwqDCoCBzd2l0Y2ggKGh3X2lwKSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBj
YXNlIEFNREdQVV9IV19JUF9HRlg6Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNjaGVk
ID0gJmFkZXYtPmdmeC5nZnhfcmluZ1swXS5zY2hlZDsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc2NoZWRzID0gJnNjaGVkOwo+PiBAQCAtMTU3LDEyICsxMzIsMTIgQEAgc3RhdGljIGlu
dCBhbWRncHVfY3R4X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgCj4+ICphZGV2LAo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzY2hlZHMgPSBhZGV2LT5qcGVnLmpwZWdfc2NoZWQ7Cj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG51bV9zY2hlZHMgPcKgIGFkZXYtPmpwZWcubnVt
X2pwZWdfc2NoZWQ7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiAtwqDC
oMKgwqDCoMKgwqAgfQo+PiArwqDCoMKgIH0KPj4gwqAgLcKgwqDCoMKgwqDCoMKgIGZvciAoaiA9
IDA7IGogPCBhbWRncHVfY3R4X251bV9lbnRpdGllc1tpXTsgKytqKQo+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByID0gZHJtX3NjaGVkX2VudGl0eV9pbml0KCZjdHgtPmVudGl0aWVzW2ldW2pd
LmVudGl0eSwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHByaW9yaXR5LCBzY2hlZHMsCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBudW1fc2NoZWRzLCAmY3R4LT5ndWlsdHkpOwo+PiArwqDC
oMKgIGZvciAoaiA9IDA7IGogPCBhbWRncHVfY3R4X251bV9lbnRpdGllc1tod19pcF07ICsraikg
ewo+PiArwqDCoMKgwqDCoMKgwqAgciA9IGRybV9zY2hlZF9lbnRpdHlfaW5pdCgmY3R4LT5lbnRp
dGllc1tod19pcF1bal0uZW50aXR5LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHByaW9yaXR5LCBzY2hlZHMsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgbnVtX3NjaGVkcywgJmN0eC0+Z3VpbHR5KTsKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIGlmIChyKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVy
cm9yX2NsZWFudXBfZW50aXRpZXM7Cj4+IMKgwqDCoMKgwqAgfQo+PiBAQCAtMTcwLDMwICsxNDUs
NTEgQEAgc3RhdGljIGludCBhbWRncHVfY3R4X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgCj4+
ICphZGV2LAo+PiDCoMKgwqDCoMKgIHJldHVybiAwOwo+PiDCoCDCoCBlcnJvcl9jbGVhbnVwX2Vu
dGl0aWVzOgo+PiAtwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBBTURHUFVfSFdfSVBfTlVNOyArK2kp
IHsKPj4gLcKgwqDCoMKgwqDCoMKgIGZvciAoaiA9IDA7IGogPCBhbWRncHVfY3R4X251bV9lbnRp
dGllc1tpXTsgKytqKQo+PiAtIGRybV9zY2hlZF9lbnRpdHlfZGVzdHJveSgmY3R4LT5lbnRpdGll
c1tpXVtqXS5lbnRpdHkpOwo+PiAtwqDCoMKgIH0KPj4gK8KgwqDCoCBmb3IgKGogPSAwOyBqIDwg
YW1kZ3B1X2N0eF9udW1fZW50aXRpZXNbaHdfaXBdOyArK2opCj4+ICsgZHJtX3NjaGVkX2VudGl0
eV9kZXN0cm95KCZjdHgtPmVudGl0aWVzW2h3X2lwXVtqXS5lbnRpdHkpOwo+PiDCoCDCoCBlcnJv
cl9jbGVhbnVwX21lbW9yeToKPj4gLcKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgQU1ER1BVX0hXX0lQ
X05VTTsgKytpKSB7Cj4+IC3CoMKgwqDCoMKgwqDCoCBmb3IgKGogPSAwOyBqIDwgYW1kZ3B1X2N0
eF9udW1fZW50aXRpZXNbaV07ICsraikgewo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1
Y3QgYW1kZ3B1X2N0eF9lbnRpdHkgKmVudGl0eSA9ICZjdHgtPmVudGl0aWVzW2ldW2pdOwo+PiAr
wqDCoMKgIGZvciAoaiA9IDA7IGogPCBhbWRncHVfY3R4X251bV9lbnRpdGllc1tod19pcF07ICsr
aikgewo+PiArwqDCoMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV9jdHhfZW50aXR5ICplbnRpdHkg
PSAmY3R4LT5lbnRpdGllc1tod19pcF1bal07Cj4+IMKgIC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGtmcmVlKGVudGl0eS0+ZmVuY2VzKTsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW50aXR5
LT5mZW5jZXMgPSBOVUxMOwo+PiAtwqDCoMKgwqDCoMKgwqAgfQo+PiArwqDCoMKgwqDCoMKgwqAg
a2ZyZWUoZW50aXR5LT5mZW5jZXMpOwo+PiArwqDCoMKgwqDCoMKgwqAgZW50aXR5LT5mZW5jZXMg
PSBOVUxMOwo+PiDCoMKgwqDCoMKgIH0KPj4gwqAgLWVycm9yX2NsZWFudXBfZW50aXR5X21lbW9y
eToKPj4gLcKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgQU1ER1BVX0hXX0lQX05VTTsgKytpKSB7Cj4+
IC3CoMKgwqDCoMKgwqDCoCBrZnJlZShjdHgtPmVudGl0aWVzW2ldKTsKPj4gLcKgwqDCoMKgwqDC
oMKgIGN0eC0+ZW50aXRpZXNbaV0gPSBOVUxMOwo+PiAtwqDCoMKgIH0KPj4gK8KgwqDCoCBrZnJl
ZShjdHgtPmVudGl0aWVzW2h3X2lwXSk7Cj4+ICvCoMKgwqAgY3R4LT5lbnRpdGllc1tod19pcF0g
PSBOVUxMOwo+PiDCoCDCoMKgwqDCoMKgIHJldHVybiByOwo+PiDCoCB9Cj4+IMKgICtzdGF0aWMg
aW50IGFtZGdwdV9jdHhfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW51bSBkcm1fc2NoZWRfcHJpb3JpdHkgcHJpb3JpdHks
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fZmlsZSAqZmlscCwK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV9jdHggKmN0eCkK
Pj4gK3sKPj4gK8KgwqDCoCBpbnQgcjsKPj4gKwo+PiArwqDCoMKgIHIgPSBhbWRncHVfY3R4X3By
aW9yaXR5X3Blcm1pdChmaWxwLCBwcmlvcml0eSk7Cj4+ICvCoMKgwqAgaWYgKHIpCj4+ICvCoMKg
wqDCoMKgwqDCoCByZXR1cm4gcjsKPj4gKwo+PiArwqDCoMKgIG1lbXNldChjdHgsIDAsIHNpemVv
ZigqY3R4KSk7Cj4+ICvCoMKgwqAgY3R4LT5hZGV2ID0gYWRldjsKPj4gKwo+PiArwqDCoMKgIGty
ZWZfaW5pdCgmY3R4LT5yZWZjb3VudCk7Cj4+ICvCoMKgwqAgc3Bpbl9sb2NrX2luaXQoJmN0eC0+
cmluZ19sb2NrKTsKPj4gK8KgwqDCoCBtdXRleF9pbml0KCZjdHgtPmxvY2spOwo+PiArCj4+ICvC
oMKgwqAgY3R4LT5yZXNldF9jb3VudGVyID0gYXRvbWljX3JlYWQoJmFkZXYtPmdwdV9yZXNldF9j
b3VudGVyKTsKPj4gK8KgwqDCoCBjdHgtPnJlc2V0X2NvdW50ZXJfcXVlcnkgPSBjdHgtPnJlc2V0
X2NvdW50ZXI7Cj4+ICvCoMKgwqAgY3R4LT52cmFtX2xvc3RfY291bnRlciA9IGF0b21pY19yZWFk
KCZhZGV2LT52cmFtX2xvc3RfY291bnRlcik7Cj4+ICvCoMKgwqAgY3R4LT5pbml0X3ByaW9yaXR5
ID0gcHJpb3JpdHk7Cj4+ICvCoMKgwqAgY3R4LT5vdmVycmlkZV9wcmlvcml0eSA9IERSTV9TQ0hF
RF9QUklPUklUWV9VTlNFVDsKPj4gKwo+PiArwqDCoMKgIHJldHVybiAwOwo+PiArCj4+ICt9Cj4+
ICsKPj4gwqAgc3RhdGljIHZvaWQgYW1kZ3B1X2N0eF9maW5pKHN0cnVjdCBrcmVmICpyZWYpCj4+
IMKgIHsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgYW1kZ3B1X2N0eCAqY3R4ID0gY29udGFpbmVyX29m
KHJlZiwgc3RydWN0IGFtZGdwdV9jdHgsIAo+PiByZWZjb3VudCk7Cj4+IEBAIC0yMDQsNyArMjAw
LDE0IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9jdHhfZmluaShzdHJ1Y3Qga3JlZiAqcmVmKQo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+PiDCoMKgwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBB
TURHUFVfSFdfSVBfTlVNOyArK2kpIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGZvciAoaiA9IDA7
IGogPCBhbWRncHVfY3R4X251bV9lbnRpdGllc1tpXTsgKytqKSB7Cj4+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfY3R4X2VudGl0eSAqZW50aXR5ID0gJmN0eC0+ZW50aXRp
ZXNbaV1bal07Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfY3R4X2Vu
dGl0eSAqZW50aXR5Owo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghY3R4LT5l
bnRpdGllc1tpXSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsK
Pj4gKwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnRpdHkgPSAmY3R4LT5lbnRpdGllc1tp
XVtqXTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFlbnRpdHktPmZlbmNlcykKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4gwqAgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZm9yIChrID0gMDsgayA8IGFtZGdwdV9zY2hlZF9qb2JzOyArK2sp
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hX2ZlbmNlX3B1dChlbnRp
dHktPmZlbmNlc1trXSk7Cj4+IEBAIC0yNDEsNiArMjQ0LDkgQEAgaW50IGFtZGdwdV9jdHhfZ2V0
X2VudGl0eShzdHJ1Y3QgYW1kZ3B1X2N0eCAqY3R4LCAKPj4gdTMyIGh3X2lwLCB1MzIgaW5zdGFu
Y2UsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4gwqDCoMKgwqDCoCB9
Cj4+IMKgICvCoMKgwqAgaWYgKGN0eC0+ZW50aXRpZXNbaHdfaXBdID09IE5VTEwpCj4+ICvCoMKg
wqDCoMKgwqDCoCBhbWRncHVfY3R4X2luaXRfZW50aXR5KGN0eCwgaHdfaXApOwo+PiArCj4+IMKg
wqDCoMKgwqAgKmVudGl0eSA9ICZjdHgtPmVudGl0aWVzW2h3X2lwXVtyaW5nXS5lbnRpdHk7Cj4+
IMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+IMKgIH0KPj4gQEAgLTI4NSw4ICsyOTEsMTEgQEAgc3Rh
dGljIHZvaWQgYW1kZ3B1X2N0eF9kb19yZWxlYXNlKHN0cnVjdCBrcmVmICpyZWYpCj4+IMKgIMKg
wqDCoMKgwqAgY3R4ID0gY29udGFpbmVyX29mKHJlZiwgc3RydWN0IGFtZGdwdV9jdHgsIHJlZmNv
dW50KTsKPj4gwqDCoMKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgQU1ER1BVX0hXX0lQX05VTTsgKytp
KSB7Cj4+IC3CoMKgwqDCoMKgwqDCoCBmb3IgKGogPSAwOyBqIDwgYW1kZ3B1X2N0eF9udW1fZW50
aXRpZXNbaV07ICsraikKPj4gK8KgwqDCoMKgwqDCoMKgIGZvciAoaiA9IDA7IGogPCBhbWRncHVf
Y3R4X251bV9lbnRpdGllc1tpXTsgKytqKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlm
ICghY3R4LT5lbnRpdGllc1tpXSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
b250aW51ZTsKPj4gZHJtX3NjaGVkX2VudGl0eV9kZXN0cm95KCZjdHgtPmVudGl0aWVzW2ldW2pd
LmVudGl0eSk7Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+IMKgwqDCoMKgwqAgfQo+PiDCoCDCoMKg
wqDCoMKgIGFtZGdwdV9jdHhfZmluaShyZWYpOwo+PiBAQCAtNTc5LDYgKzU4OCw5IEBAIGxvbmcg
YW1kZ3B1X2N0eF9tZ3JfZW50aXR5X2ZsdXNoKHN0cnVjdCAKPj4gYW1kZ3B1X2N0eF9tZ3IgKm1n
ciwgbG9uZyB0aW1lb3V0KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmb3IgKGogPSAw
OyBqIDwgYW1kZ3B1X2N0eF9udW1fZW50aXRpZXNbaV07ICsraikgewo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5ICplbnRpdHk7Cj4+
IMKgICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFjdHgtPmVudGl0aWVzW2ld
KQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4+
ICsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnRpdHkgPSAmY3R4LT5l
bnRpdGllc1tpXVtqXS5lbnRpdHk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgdGltZW91dCA9IGRybV9zY2hlZF9lbnRpdHlfZmx1c2goZW50aXR5LCB0aW1lb3V0KTsKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+PiBAQCAtNjAxLDExICs2MTMsMTMgQEAgdm9p
ZCBhbWRncHVfY3R4X21ncl9lbnRpdHlfZmluaShzdHJ1Y3QgCj4+IGFtZGdwdV9jdHhfbWdyICpt
Z3IpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIERSTV9FUlJPUigiY3R4ICVwIGlzIHN0
aWxsIGFsaXZlXG4iLCBjdHgpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51
ZTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gLQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZm9y
IChpID0gMDsgaSA8IEFNREdQVV9IV19JUF9OVU07ICsraSkgewo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBmb3IgKGogPSAwOyBqIDwgYW1kZ3B1X2N0eF9udW1fZW50aXRpZXNbaV07ICsr
aikgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fc2No
ZWRfZW50aXR5ICplbnRpdHk7Cj4+IMKgICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aWYgKCFjdHgtPmVudGl0aWVzW2ldKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgY29udGludWU7Cj4+ICsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBlbnRpdHkgPSAmY3R4LT5lbnRpdGllc1tpXVtqXS5lbnRpdHk7Cj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZHJtX3NjaGVkX2VudGl0eV9maW5pKGVudGl0eSk7Cj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZngK
