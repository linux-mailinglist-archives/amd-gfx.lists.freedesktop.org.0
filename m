Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE361AD564
	for <lists+amd-gfx@lfdr.de>; Fri, 17 Apr 2020 06:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96AA6E222;
	Fri, 17 Apr 2020 04:52:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B756E222
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 Apr 2020 04:52:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PaZdvTUuXVmVhWrY3x1ogLjKkCaFcPGX/Vya6wWLlvsLXkMOuuHVoGUkHf/pxh2qIZ1If8N/yp0a8VAL+9d9KajqM3T9BoJ+zpKQ1cqRiD5eLTFj40Bouf5JrPeD00ZO6hKObLpmUA5hb7Fqcl6eQAlu6uv9vCwlH919MvJdm05Son2tV2B2636bjRB+4dPCXzissmpAZHwoAKE05T+qPdEatSOKdeZIfVqgFBjMZZWVlsncviIjJOCxNr8MXWbyCJjTptZLWSbtfXcD/+PEKRqKgDg/WVntvjWKHUYNDM8SJvvLdX5lzsbArIs7/Bm2vJmhk7T5ie8xIRTAdw8K6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtG3zKMbab8xDJJJUHKnZA+cL8kIA+8+jU/IRWMmoM8=;
 b=BwSn5m53YM9mJ1rvlVmpqIv6f/MepqdGGluwYyQPT0kTlgbLlwRZ/h3X8wb/0LO4J23oBtyKS2QV8UZr5q7z1T5SV+GWFp6mZekBgFEceYhByWX24/nufMIyg/mRlZjBmw3AZ6DZQdBrt+mGaNHZFXYoHCkwgEjboaBV2In+3YB/QjcHvSuZWlxHt4KClMiG5lOq4TQ6LoAdR7PKjChleyturzpk2ONOY+aXmzbXrZ22QrTXAiwlIIcbdRhzaoerbRZLhs6Wlx5qMMNBXqZsJRViGQAJzZ9Dw++vV4XzT8Sinoi61dW58Y0m3ZeDERBoJGllfmaMd1wPTXqpd/MvEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtG3zKMbab8xDJJJUHKnZA+cL8kIA+8+jU/IRWMmoM8=;
 b=ITXqoNpQgQQXzbHlSiANNX/kOVDmV7ldAQFfXg8W/g08USMaxv/UCI84P5tCxVUC3k6VA7cgd+cbli5NRfmHizJ7xweXR/vIA+81cPG8l6U3OIaecURrF0nsx9tyTK7i9m/twGW1zWgsVooZ+CnpzKb9GESNvaXo6fOFiDHVSEI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
Received: from SN1PR12MB2414.namprd12.prod.outlook.com (2603:10b6:802:2e::31)
 by SN1PR12MB2464.namprd12.prod.outlook.com (2603:10b6:802:24::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.28; Fri, 17 Apr
 2020 04:52:16 +0000
Received: from SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::38ef:1510:9525:f806]) by SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::38ef:1510:9525:f806%7]) with mapi id 15.20.2900.028; Fri, 17 Apr 2020
 04:52:16 +0000
Subject: Re: [PATCH] drm/amdgpu: fix race between pstate and remote buffer map
To: Jonathan Kim <jonathan.kim@amd.com>
References: <20200416115953.80843-1-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <49f4697c-0866-b03a-9fd6-d2476b67e874@amd.com>
Date: Fri, 17 Apr 2020 00:52:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200416115953.80843-1-jonathan.kim@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::45)
 To SN1PR12MB2414.namprd12.prod.outlook.com
 (2603:10b6:802:2e::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.63.128) by
 YT1PR01CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.25 via Frontend Transport; Fri, 17 Apr 2020 04:52:15 +0000
X-Originating-IP: [142.116.63.128]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b4e2b830-8f2e-4357-a158-08d7e28b1a09
X-MS-TrafficTypeDiagnostic: SN1PR12MB2464:|SN1PR12MB2464:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB24648AABF31ADB48BDBCBD9392D90@SN1PR12MB2464.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0376ECF4DD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2414.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(346002)(366004)(136003)(39860400002)(396003)(376002)(186003)(5660300002)(66476007)(4326008)(6862004)(37006003)(36756003)(86362001)(52116002)(16526019)(8676002)(26005)(478600001)(31696002)(6636002)(8936002)(316002)(81156014)(2906002)(44832011)(6486002)(16576012)(66556008)(66946007)(956004)(31686004)(2616005);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gS5yxZYcY1oenV8N8K4vqtWYOjFVnXvrSrHl9KtYWOSb0TnPjcKLBTXxvgqBTyFd9gzpYh5dJ3jH6tqOkGAV6wIFHrNJvwaX4Dyz8uZRasJAOo/s1Y9YvhdGX0rji58eno6U/wpMFTB6nzCfF96Fp+NVkExcg3Uv1WXmBc2SDhLkaITqlpRtNKZfHnF/TtOzItkDe5ByBRXFUdlt2BlkCcEDoM2s9T8XVDN1+8ynlYKdyc3Ew/FK6PlrLbjDUlvfU7ff8PrpDsCoS5K594wu1EaoQD68KnyMTt4sezNk3j9WqjSLk4/7sV30b7s2CUqij0RncJUQxssNTQfoL9mORXLqNR9EeUuuTlXWeA2q9YSeYeG4RC45bJbCIRc51vASnLCVn6AEPOhJWxJ92sd0IvILfpxBFsuzFvlN2xIJlmlcNnHpJ/4m1nrGnbRVpcxd
X-MS-Exchange-AntiSpam-MessageData: N5i2a6E0W09cp3Wlf4cCnit/vo1Ks4agXwbxXy9OUAXxIqXIMDNeVIVAlxvVg9+/I/yeGUKq735xjj/A+vJTY3WJ/QhhnY+Si8ksoV/HmJPuQmftERtscdj6au8sPgbFe3gTOLwfsUd1MSZc/YVDLg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e2b830-8f2e-4357-a158-08d7e28b1a09
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2020 04:52:16.3953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mdFAkS7VAQOiv6WUCrYM5YfYByC2F5uOrIorDPV/plSK1TprCBQVT9rgWjBAx+hATx3Pyk17WBWzXEqsdOMSGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2464
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
Cc: amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjAyMC0wNC0xNiB1bSA3OjU5IGEubS4gc2NocmllYiBKb25hdGhhbiBLaW06Cj4gVmVnYTIw
IGFyYml0cmF0ZXMgcHN0YXRlIGF0IGhpdmUgbGV2ZWwgYW5kIG5vdCBkZXZpY2UgbGV2ZWwuIExh
c3QgcGVlciB0bwo+IHJlbW90ZSBidWZmZXIgdW5tYXAgY291bGQgZHJvcCBQLVN0YXRlIHdoaWxl
IGFub3RoZXIgcHJvY2VzcyBpcyBzdGlsbAo+IHJlbW90ZSBidWZmZXIgbWFwcGVkLgo+Cj4gV2l0
aCB0aGlzIGZpeCwgUC1TdGF0ZXMgc3RpbGwgbmVlZHMgdG8gYmUgZGlzYWJsZWQgZm9yIG5vdyBh
cyBTTVUgYnVnCj4gd2FzIGRpc2NvdmVyZWQgb24gc3luY2hyb25vdXMgUDJQIHRyYW5zZmVycy4g
IFRoaXMgc2hvdWxkIGJlIGZpeGVkIGluIHRoZQo+IG5leHQgRlcgdXBkYXRlLgo+Cj4gU2lnbmVk
LW9mZi1ieTogSm9uYXRoYW4gS2ltIDxKb25hdGhhbi5LaW1AYW1kLmNvbT4KClRoaXMgbG9va3Mg
cmVhc29uYWJsZS4gSSBoYXZlIHNvbWUgc3VnZ2VzdGlvbnMgaW5saW5lIGZvciBzb21lIGNsZWFy
ZXIKdmFyaWFibGUgbmFtZXMuIFdpdGggdGhhdCBmaXhlZCB0aGUgcGF0Y2ggaXMKClJldmlld2Vk
LWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KClNlZSBpbmxpbmUg
Li4uCgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggICAgICB8
ICAyIC0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgICB8IDE2ICsr
LS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaCAgIHwgIDQgLS0K
PiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuYyB8IDY2ICsrKysrKysr
KysrKy0tLS0tLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfeGdt
aS5oIHwgIDYgKysrCj4gIDUgZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgNTEgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAo+IGluZGV4IDRlMWQ0
Y2ZlN2E5Zi4uOTRkZmY4OTkyNDhkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdS5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
LmgKPiBAQCAtOTgyLDggKzk4Miw2IEBAIHN0cnVjdCBhbWRncHVfZGV2aWNlIHsKPiAgCXVpbnQ2
NF90CQkJdW5pcXVlX2lkOwo+ICAJdWludDY0X3QJZGZfcGVyZm1vbl9jb25maWdfYXNzaWduX21h
c2tbQU1ER1BVX01BWF9ERl9QRVJGTU9OU107Cj4gIAo+IC0JLyogZGV2aWNlIHBzdGF0ZSAqLwo+
IC0JaW50CQkJCXBzdGF0ZTsKPiAgCS8qIGVuYWJsZSBydW50aW1lIHBtIG9uIHRoZSBkZXZpY2Ug
Ki8KPiAgCWJvb2wgICAgICAgICAgICAgICAgICAgICAgICAgICAgcnVucG07Cj4gIAlib29sICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGluX3J1bnBtOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV92bS5jCj4gaW5kZXggYWNjYmIzNGVhNjcwLi45NTU2MGVlYTYxYzQgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+IEBAIC0yMTM1LDExICsyMTM1
LDggQEAgc3RydWN0IGFtZGdwdV9ib192YSAqYW1kZ3B1X3ZtX2JvX2FkZChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwKPiAgCWlmIChibyAmJiBhbWRncHVfeGdtaV9zYW1lX2hpdmUoYWRldiwg
YW1kZ3B1X3R0bV9hZGV2KGJvLT50Ym8uYmRldikpICYmCj4gIAkgICAgKGJvLT5wcmVmZXJyZWRf
ZG9tYWlucyAmIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0pKSB7Cj4gIAkJYm9fdmEtPmlzX3hnbWkg
PSB0cnVlOwo+IC0JCW11dGV4X2xvY2soJmFkZXYtPnZtX21hbmFnZXIubG9ja19wc3RhdGUpOwo+
ICAJCS8qIFBvd2VyIHVwIFhHTUkgaWYgaXQgY2FuIGJlIHBvdGVudGlhbGx5IHVzZWQgKi8KPiAt
CQlpZiAoKythZGV2LT52bV9tYW5hZ2VyLnhnbWlfbWFwX2NvdW50ZXIgPT0gMSkKPiAtCQkJYW1k
Z3B1X3hnbWlfc2V0X3BzdGF0ZShhZGV2LCAxKTsKPiAtCQltdXRleF91bmxvY2soJmFkZXYtPnZt
X21hbmFnZXIubG9ja19wc3RhdGUpOwo+ICsJCWFtZGdwdV94Z21pX3NldF9wc3RhdGUoYWRldiwg
QU1ER1BVX1hHTUlfUFNUQVRFX01BWF9WRUdBMjApOwo+ICAJfQo+ICAKPiAgCXJldHVybiBib192
YTsKPiBAQCAtMjU2MiwxMiArMjU1OSw4IEBAIHZvaWQgYW1kZ3B1X3ZtX2JvX3JtdihzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwKPiAgCj4gIAlkbWFfZmVuY2VfcHV0KGJvX3ZhLT5sYXN0X3B0
X3VwZGF0ZSk7Cj4gIAo+IC0JaWYgKGJvICYmIGJvX3ZhLT5pc194Z21pKSB7Cj4gLQkJbXV0ZXhf
bG9jaygmYWRldi0+dm1fbWFuYWdlci5sb2NrX3BzdGF0ZSk7Cj4gLQkJaWYgKC0tYWRldi0+dm1f
bWFuYWdlci54Z21pX21hcF9jb3VudGVyID09IDApCj4gLQkJCWFtZGdwdV94Z21pX3NldF9wc3Rh
dGUoYWRldiwgMCk7Cj4gLQkJbXV0ZXhfdW5sb2NrKCZhZGV2LT52bV9tYW5hZ2VyLmxvY2tfcHN0
YXRlKTsKPiAtCX0KPiArCWlmIChibyAmJiBib192YS0+aXNfeGdtaSkKPiArCQlhbWRncHVfeGdt
aV9zZXRfcHN0YXRlKGFkZXYsIEFNREdQVV9YR01JX1BTVEFURV9NSU4pOwo+ICAKPiAgCWtmcmVl
KGJvX3ZhKTsKPiAgfQo+IEBAIC0zMTc3LDkgKzMxNzAsNiBAQCB2b2lkIGFtZGdwdV92bV9tYW5h
Z2VyX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gIAo+ICAJaWRyX2luaXQoJmFk
ZXYtPnZtX21hbmFnZXIucGFzaWRfaWRyKTsKPiAgCXNwaW5fbG9ja19pbml0KCZhZGV2LT52bV9t
YW5hZ2VyLnBhc2lkX2xvY2spOwo+IC0KPiAtCWFkZXYtPnZtX21hbmFnZXIueGdtaV9tYXBfY291
bnRlciA9IDA7Cj4gLQltdXRleF9pbml0KCZhZGV2LT52bV9tYW5hZ2VyLmxvY2tfcHN0YXRlKTsK
PiAgfQo+ICAKPiAgLyoqCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92bS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmgKPiBp
bmRleCBlYTc3MWQ4NGJmMmIuLmM4ZTY4ZDc4OTBiZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92bS5oCj4gQEAgLTM1NywxMCArMzU3LDYgQEAgc3RydWN0IGFtZGdwdV92
bV9tYW5hZ2VyIHsKPiAgCSAqLwo+ICAJc3RydWN0IGlkcgkJCQlwYXNpZF9pZHI7Cj4gIAlzcGlu
bG9ja190CQkJCXBhc2lkX2xvY2s7Cj4gLQo+IC0JLyogY291bnRlciBvZiBtYXBwZWQgbWVtb3J5
IHRocm91Z2ggeGdtaSAqLwo+IC0JdWludDMyX3QJCQkJeGdtaV9tYXBfY291bnRlcjsKPiAtCXN0
cnVjdCBtdXRleAkJCQlsb2NrX3BzdGF0ZTsKPiAgfTsKPiAgCj4gICNkZWZpbmUgYW1kZ3B1X3Zt
X2NvcHlfcHRlKGFkZXYsIGliLCBwZSwgc3JjLCBjb3VudCkgKChhZGV2KS0+dm1fbWFuYWdlci52
bV9wdGVfZnVuY3MtPmNvcHlfcHRlKChpYiksIChwZSksIChzcmMpLCAoY291bnQpKSkKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94Z21pLmMKPiBpbmRleCA4YzMyMTU1MDVlNzgu
LjUyZjQ1YjlmZTI3MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfeGdtaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hn
bWkuYwo+IEBAIC0zNzMsNyArMzczLDEzIEBAIHN0cnVjdCBhbWRncHVfaGl2ZV9pbmZvICphbWRn
cHVfZ2V0X3hnbWlfaGl2ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IGxvCj4gIAo+
ICAJaWYgKGxvY2spCj4gIAkJbXV0ZXhfbG9jaygmdG1wLT5oaXZlX2xvY2spOwo+IC0JdG1wLT5w
c3RhdGUgPSAtMTsKPiArCXRtcC0+cHN0YXRlID0gQU1ER1BVX1hHTUlfUFNUQVRFX1VOS05PV047
Cj4gKwl0bXAtPmhpZ2hfZ3B1ID0gTlVMTDsKPiArCS8qCj4gKwkgKiBoaXZlIHBzdGF0ZSBvbiBi
b290IGlzIGhpZ2ggaW4gdmVnYTIwIHNvIHdlIGhhdmUgdG8gZ28gdG8gbG93Cj4gKwkgKiBwc3Rh
dGUgb24gYWZ0ZXIgYm9vdC4KPiArCSAqLwo+ICsJdG1wLT5tYXBfY291bnQgPSBBTURHUFVfTUFY
X1hHTUlfREVWSUNFX1BFUl9ISVZFOwo+ICAJbXV0ZXhfdW5sb2NrKCZ4Z21pX211dGV4KTsKPiAg
Cj4gIAlyZXR1cm4gdG1wOwo+IEBAIC0zODMsNTAgKzM4OSw0OSBAQCBpbnQgYW1kZ3B1X3hnbWlf
c2V0X3BzdGF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IHBzdGF0ZSkKPiAgewo+
ICAJaW50IHJldCA9IDA7Cj4gIAlzdHJ1Y3QgYW1kZ3B1X2hpdmVfaW5mbyAqaGl2ZSA9IGFtZGdw
dV9nZXRfeGdtaV9oaXZlKGFkZXYsIDApOwo+IC0Jc3RydWN0IGFtZGdwdV9kZXZpY2UgKnRtcF9h
ZGV2Owo+IC0JYm9vbCB1cGRhdGVfaGl2ZV9wc3RhdGUgPSB0cnVlOwo+IC0JYm9vbCBpc19oaWdo
X3BzdGF0ZSA9IHBzdGF0ZSAmJiBhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9WRUdBMjA7Cj4gKwlz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqdGFyX2FkZXYgPSBoaXZlLT5oaWdoX2dwdSA/Cj4gKwkJCQkJ
CQloaXZlLT5oaWdoX2dwdSA6IGFkZXY7CgpJJ20gbm90IHN1cmUgd2hhdCAidGFyIiBzdGFuZHMg
Zm9yIGhlcmUuIEkgZ3Vlc3MgdGhlICJyIiBzdGFuZHMgZm9yCiJyZXF1ZXN0Ij8KCgo+ICsJYm9v
bCBtYXAgPSBwc3RhdGUgPT0gQU1ER1BVX1hHTUlfUFNUQVRFX01BWF9WRUdBMjA7Cj4gKwlib29s
IGluaXRfbG93ID0gaGl2ZS0+cHN0YXRlID09IEFNREdQVV9YR01JX1BTVEFURV9VTktOT1dOOwo+
ICAKPiAtCWlmICghaGl2ZSkKPiArCWlmICghaGl2ZSB8fCBhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJ
UF9WRUdBMjApCj4gIAkJcmV0dXJuIDA7Cj4gIAo+ICAJbXV0ZXhfbG9jaygmaGl2ZS0+aGl2ZV9s
b2NrKTsKPiAgCj4gLQlpZiAoaGl2ZS0+cHN0YXRlID09IHBzdGF0ZSkgewo+IC0JCWFkZXYtPnBz
dGF0ZSA9IGlzX2hpZ2hfcHN0YXRlID8gcHN0YXRlIDogYWRldi0+cHN0YXRlOwo+ICsJaWYgKG1h
cCkKPiArCQloaXZlLT5tYXBfY291bnQrKzsKPiArCWVsc2UKPiArCQloaXZlLT5tYXBfY291bnQt
LTsKPiArCj4gKwkvKgo+ICsJICogVmVnYTIwIG9ubHkgbmVlZHMgc2luZ2xlIHBlZXIgdG8gcmVx
dWVzdCBwc3RhdGUgaGlnaCBmb3IgdGhlIGhpdmUgdG8KPiArCSAqIGdvIGhpZ2ggYnV0IGFsbCBw
ZWVycyBtdXN0IHJlcXVlc3QgcHN0YXRlIGxvdyBmb3IgdGhlIGhpdmUgdG8gZ28gbG93Cj4gKwkg
Ki8KPiArCWlmIChoaXZlLT5wc3RhdGUgPT0gcHN0YXRlIHx8ICghbWFwICYmIGhpdmUtPm1hcF9j
b3VudCAmJiAhaW5pdF9sb3cpKQo+ICAJCWdvdG8gb3V0Owo+IC0JfQo+ICAKPiAtCWRldl9kYmco
YWRldi0+ZGV2LCAiU2V0IHhnbWkgcHN0YXRlICVkLlxuIiwgcHN0YXRlKTsKPiArCWRldl9kYmco
dGFyX2FkZXYtPmRldiwgIlNldCB4Z21pIHBzdGF0ZSAlZC5cbiIsIHBzdGF0ZSk7Cj4gIAo+IC0J
cmV0ID0gYW1kZ3B1X2RwbV9zZXRfeGdtaV9wc3RhdGUoYWRldiwgcHN0YXRlKTsKPiArCXJldCA9
IGFtZGdwdV9kcG1fc2V0X3hnbWlfcHN0YXRlKHRhcl9hZGV2LCBwc3RhdGUpOwo+ICAJaWYgKHJl
dCkgewo+IC0JCWRldl9lcnIoYWRldi0+ZGV2LAo+ICsJCWRldl9lcnIodGFyX2FkZXYtPmRldiwK
PiAgCQkJIlhHTUk6IFNldCBwc3RhdGUgZmFpbHVyZSBvbiBkZXZpY2UgJWxseCwgaGl2ZSAlbGx4
LCByZXQgJWQiLAo+IC0JCQlhZGV2LT5nbWMueGdtaS5ub2RlX2lkLAo+IC0JCQlhZGV2LT5nbWMu
eGdtaS5oaXZlX2lkLCByZXQpOwo+ICsJCQl0YXJfYWRldi0+Z21jLnhnbWkubm9kZV9pZCwKPiAr
CQkJdGFyX2FkZXYtPmdtYy54Z21pLmhpdmVfaWQsIHJldCk7Cj4gIAkJZ290byBvdXQ7Cj4gIAl9
Cj4gIAo+IC0JLyogVXBkYXRlIGRldmljZSBwc3RhdGUgKi8KPiAtCWFkZXYtPnBzdGF0ZSA9IHBz
dGF0ZTsKPiAtCj4gLQkvKgo+IC0JICogVXBkYXRlIHRoZSBoaXZlIHBzdGF0ZSBvbmx5IGFsbCBk
ZXZpY2VzIG9mIHRoZSBoaXZlCj4gLQkgKiBhcmUgaW4gdGhlIHNhbWUgcHN0YXRlCj4gLQkgKi8K
PiAtCWxpc3RfZm9yX2VhY2hfZW50cnkodG1wX2FkZXYsICZoaXZlLT5kZXZpY2VfbGlzdCwgZ21j
LnhnbWkuaGVhZCkgewo+IC0JCWlmICh0bXBfYWRldi0+cHN0YXRlICE9IGFkZXYtPnBzdGF0ZSkg
ewo+IC0JCQl1cGRhdGVfaGl2ZV9wc3RhdGUgPSBmYWxzZTsKPiAtCQkJYnJlYWs7Cj4gLQkJfQo+
IC0JfQo+IC0JaWYgKHVwZGF0ZV9oaXZlX3BzdGF0ZSB8fCBpc19oaWdoX3BzdGF0ZSkKPiArCWlm
IChpbml0X2xvdykKPiArCQloaXZlLT5wc3RhdGUgPSBoaXZlLT5tYXBfY291bnQgPwo+ICsJCQkJ
CWhpdmUtPnBzdGF0ZSA6IEFNREdQVV9YR01JX1BTVEFURV9NSU47Cj4gKwllbHNlIHsKPiAgCQlo
aXZlLT5wc3RhdGUgPSBwc3RhdGU7Cj4gLQo+ICsJCWhpdmUtPmhpZ2hfZ3B1ID0gcHN0YXRlICE9
IEFNREdQVV9YR01JX1BTVEFURV9NSU4gPwo+ICsJCQkJCQkJYWRldiA6IE5VTEw7Cj4gKwl9Cj4g
IG91dDoKPiAgCW11dGV4X3VubG9jaygmaGl2ZS0+aGl2ZV9sb2NrKTsKPiAtCj4gIAlyZXR1cm4g
cmV0Owo+ICB9Cj4gIAo+IEBAIC01MDcsOSArNTEyLDYgQEAgaW50IGFtZGdwdV94Z21pX2FkZF9k
ZXZpY2Uoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gIAkJZ290byBleGl0Owo+ICAJfQo+
ICAKPiAtCS8qIFNldCBkZWZhdWx0IGRldmljZSBwc3RhdGUgKi8KPiAtCWFkZXYtPnBzdGF0ZSA9
IC0xOwo+IC0KPiAgCXRvcF9pbmZvID0gJmFkZXYtPnBzcC54Z21pX2NvbnRleHQudG9wX2luZm87
Cj4gIAo+ICAJbGlzdF9hZGRfdGFpbCgmYWRldi0+Z21jLnhnbWkuaGVhZCwgJmhpdmUtPmRldmlj
ZV9saXN0KTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3hnbWkuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94Z21pLmgKPiBpbmRl
eCBkNWE2MzkwNGVjMzMuLmI1YzRhY2YyMzE2ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfeGdtaS5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3hnbWkuaAo+IEBAIC0yNSw2ICsyNSwxMCBAQAo+ICAjaW5jbHVkZSA8ZHJt
L3Rhc2tfYmFycmllci5oPgo+ICAjaW5jbHVkZSAiYW1kZ3B1X3BzcC5oIgo+ICAKPiArI2RlZmlu
ZSBBTURHUFVfWEdNSV9QU1RBVEVfVU5LTk9XTgktMQo+ICsjZGVmaW5lIEFNREdQVV9YR01JX1BT
VEFURV9NSU4JCTAKPiArI2RlZmluZSBBTURHUFVfWEdNSV9QU1RBVEVfTUFYX1ZFR0EyMAkxCgpZ
b3UgY291bGQgZGVmaW5lIHRoaXMgYXMgYW4gZW51bSBhbmQgdXNlIHRoYXQgYmVsb3cuCgoKPiAr
Cj4gIHN0cnVjdCBhbWRncHVfaGl2ZV9pbmZvIHsKPiAgCXVpbnQ2NF90CQloaXZlX2lkOwo+ICAJ
c3RydWN0IGxpc3RfaGVhZAlkZXZpY2VfbGlzdDsKPiBAQCAtMzQsNiArMzgsOCBAQCBzdHJ1Y3Qg
YW1kZ3B1X2hpdmVfaW5mbyB7Cj4gIAlzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSBkZXZfYXR0cjsK
PiAgCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2Owo+ICAJaW50IHBzdGF0ZTsgLyowIC0tIGxv
dyAsIDEgLS0gaGlnaCAsIC0xIHVua25vd24qLwoKVGhlIGNvbW1lbnQgaGVyZSBpc24ndCByZWFs
bHkgbmVlZGVkIGFueSBtb3JlIHdpdGggdGhlIGRlZmluaXRpb25zCmFib3ZlLiBCdXQgaWYgeW91
IG1ha2UgdGhhdCBhbiBlbnVtLCB5b3UgY2FuIG1ha2UgdGhlIGNvbm5lY3Rpb24gY2xlYXIKYnkg
dXNpbmcgdGhlIGVudW0gdHlwZSBoZXJlIGluc3RlYWQgb2YgaW50LgoKCj4gKwlpbnQgbWFwX2Nv
dW50Owo+ICsJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmhpZ2hfZ3B1OwoKVGhlIG5hbWUgIm1hcF9j
b3VudCIgZG9lc24ndCBtYWtlIG11Y2ggc2Vuc2UgaW4gdGhlIGNvbnRleHQgb2YgdGhlIFhHTUkK
aGl2ZS4gQW5kIGl0IGRvZXNuJ3Qgc2hvdyBob3cgdGhlIG1hcF9jb3VudCByZWxhdGVzIHRvIGhp
Z2hfZ3B1LiBJJ2QKcmVuYW1lIHRoZXNlIHRvIGhpZ2hfcmVxdWVzdF9jb3VudCBhbmQgaGlnaF9y
ZXF1ZXN0X2dwdS4gT3Igc29tZQphYnJldmlhdGlvbiBpZiB0aGF0J3MgdG8gdmVyYm9zZSAoaGlf
cmVxX2NvdW50LCBoaV9yZXFfZ3B1KS4KClJlZ2FyZHMsCsKgIEZlbGl4CgoKPiAgCXN0cnVjdCB0
YXNrX2JhcnJpZXIgdGI7Cj4gIH07Cj4gIApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZngK
