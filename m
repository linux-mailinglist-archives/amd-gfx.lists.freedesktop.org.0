Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8BE1142FE
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Dec 2019 15:50:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF8C6E124;
	Thu,  5 Dec 2019 14:50:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700072.outbound.protection.outlook.com [40.107.70.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361606E124
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Dec 2019 14:50:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cThSFWR7dUzKtBKintc7RURuunXc8LMLKoaIofe5CROVqtnZmaJbwGL8Q37BnqA/cH5KGVYX1mLc7j5vSwRVvtwXEAZQtfQUs8iQF5T2UVhUm7pivq9Qghxfot7m85r55mnBb9srK2zv6gGNn+l2nH7toiE/jp8UnfHScktxplylRi4roXybegWrsHzw46MzXYwnP9L3qbty9cSpJ4RVKnaAFIeRWYScpBiY2y470E3BWlY6HKlsUEhQYREXspie8rP2G55JSmlzfaW8u/4jNM6VP1O9QyVjs0klraGJj9Mb8Lr5uqbmtRoChD7ccXV5b5PiRSDQibzFsxGi1StPTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhXD2Nq7g9+1uStMGa0fgi2EsAABl+DNVE3+q08X0gg=;
 b=jWktSUIa9MIJwj9QkKuSNuigkI+18OPzYArUvpZzWrDLYMnWRQ+E/kSbPaCRtegZm8Wwy3vc+gf/K42rbQVxBGcrzDd6Ljpf6vOu303z303DOyfUig10av/O/QCclw3z7b7MRM0euOjbhmtmi8ZZOXo3m3DyYwlk3RIWSIxMuh86VhvLo2IugCi3LQerkrZFoDFB5oQ/k9E70dX1nMS0Ga8FM32ywt+eHikfxuoWSB2xkh7mwpyQDBS9I3CnnQ+IEy8lihOGaD7dTdinVd0HEvGD/rLzf6NJ2YHzR471v1m9hLwlC2V87lvPflm/T314LWuIzbvNDNS85ph5SDLmFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2376.namprd12.prod.outlook.com (52.132.143.139) by
 DM5PR12MB1338.namprd12.prod.outlook.com (10.168.235.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Thu, 5 Dec 2019 14:50:37 +0000
Received: from DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::b8ee:257d:3a23:ae8a]) by DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::b8ee:257d:3a23:ae8a%7]) with mapi id 15.20.2516.014; Thu, 5 Dec 2019
 14:50:37 +0000
Subject: Re: [PATCH] drm/scheduler: rework entity creation
To: alexander.deucher@amd.com, kenny.ho@amd.com, christian.koenig@amd.com
References: <20191205144258.5580-1-nirmoy.das@amd.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <503c7742-afd0-f70d-d345-5dd02a72ab70@amd.com>
Date: Thu, 5 Dec 2019 15:50:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
In-Reply-To: <20191205144258.5580-1-nirmoy.das@amd.com>
Content-Language: en-US
X-ClientProxiedBy: ZR0P278CA0020.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::7) To DM5PR12MB2376.namprd12.prod.outlook.com
 (2603:10b6:4:b9::11)
MIME-Version: 1.0
X-Originating-IP: [2003:c5:8f4c:b00:cd77:8bff:f597:420f]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 09df206a-dd12-4ca9-8341-08d779927da4
X-MS-TrafficTypeDiagnostic: DM5PR12MB1338:|DM5PR12MB1338:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1338242904A25C248AC9B7198B5C0@DM5PR12MB1338.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 02426D11FE
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(189003)(199004)(25786009)(23676004)(6666004)(2616005)(52116002)(99286004)(76176011)(11346002)(186003)(58126008)(4326008)(53546011)(498600001)(14454004)(14444005)(230700001)(6506007)(36756003)(81156014)(6636002)(2906002)(66556008)(66476007)(66946007)(50466002)(8936002)(6486002)(6512007)(5660300002)(229853002)(31696002)(65956001)(8676002)(81166006)(305945005)(31686004)(30864003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1338;
 H:DM5PR12MB2376.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BHdZqLqF7+Q7dNL+U6VJSeAWv+kDm8+93eDDPJBfZ0kUFadxbB/YeEO59g04NJe59TDMJ9oG93TrQB5QCMSrUfvbt5E7ve9txbHL3wSu5vqonQ25oRPn3gf3OQSl2u64M/F5VRPdRzC45z9gDfqMib6LuyK9/Jj3d3I4Zuoq7NXJozVK7z22q8msq0ZjE1dS4pm9yQHBvhzvjr3GVhsxxdfiejIfZPbiFguYHJSD5TD1dp/DsNxdazeCzSXSqojUfRlYPUeQm32Bxl+W1ShJoFdUaKeQp8uTbgxQtmmFzc/EyvXy6PpRSRHEJg61eVJ6XA7ZYUm0VdRm77ceDkEq5mMpqVjtTx3GjHsg6mWZF1X4CmTgnmow+48hhaoXAO333HHXi3xnGjYNr38Ia8Q1ydBGdtlB5G6vPwkMCY2WpEvuCCwzgex6F+pmPUMkGFDI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09df206a-dd12-4ca9-8341-08d779927da4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2019 14:50:37.8422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZV2NPV2Sd+QSsrmOmkO2+oQ0fQky14NEzddPQxAo6Ftm9Wm8W64YpEOWb4WkhEMQOLHhY2UjLaX70uA6kV6Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1338
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhXD2Nq7g9+1uStMGa0fgi2EsAABl+DNVE3+q08X0gg=;
 b=0a80DAwbr5IDMBXugpvyQqFUIzk7hhA37cPrv7DMe50VxKDrj+5RCn8kCZ0TwkXwmoHlmB9AqQKO8CG1aZI5X3RLWsBJocTpsDOMyNYuKYWFQJmcFFm2WFIh0Y4V6efj7+cgJ3dAvJvppCpu+Qz3Hje5302UhNdKL4MnOxInXHY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nirmoy.Das@amd.com; 
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: nirmoy.das@amd.com, amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Ck9uIDEyLzUvMTkgMzo0MiBQTSwgTmlybW95IERhcyB3cm90ZToKPiBFbnRpdHkgY3VycmVudGx5
IGtlZXBzIGEgY29weSBvZiBydW5fcXVldWUgbGlzdCBhbmQgbW9kaWZ5IGl0IGluCj4gZHJtX3Nj
aGVkX2VudGl0eV9zZXRfcHJpb3JpdHkoKS4gRW50aXRpZXMgc2hvdWxkbid0IG1vZGlmeSBydW5f
cXVldWUKPiBsaXN0LiBVc2UgZHJtX2dwdV9zY2hlZHVsZXIgbGlzdCBpbnN0ZWFkIG9mIGRybV9z
Y2hlZF9ycSBsaXN0Cj4gaW4gZHJtX3NjaGVkX2VudGl0eSBzdHJ1Y3QuIEluIHRoaXMgd2F5IHdl
IGNhbiBzZWxlY3QgYSBydW5xdWV1ZSBiYXNlZAo+IG9uIGVudGl0eS9jdHgncyBwcmlvcml0eSBm
b3IgYSAgZHJtIHNjaGVkdWxlci4KPgo+IFNpZ25lZC1vZmYtYnk6IE5pcm1veSBEYXMgPG5pcm1v
eS5kYXNAYW1kLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9jdHguYyAgfCAgNyArKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90
dG0uYyAgfCAgOCArKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91dmQu
YyAgfCAgNyArKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuYyAg
fCAgNyArKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jICAgfCAx
NCArKystLQo+ICAgZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kcnYuYyAgICB8ICA3
ICsrLQo+ICAgZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9zY2hlZC5jICAgICAgICB8ICA1ICst
Cj4gICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMgIHwgIDggKystCj4g
ICBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jIHwgNzAgKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9kcnYuYyAgICAgICAg
ICAgIHwgIDggKystCj4gICBpbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVyLmggICAgICAgICAgICAg
IHwgIDggKystCj4gICAxMSBmaWxlcyBjaGFuZ2VkLCA3NyBpbnNlcnRpb25zKCspLCA3MiBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfY3R4LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMKPiBpbmRl
eCBhMGQzZDdiNzU2ZWIuLjFkNjg1MGFmOTkwOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfY3R4LmMKPiBAQCAtMTIyLDcgKzEyMiw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1
X2N0eF9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAgCj4gICAJZm9yIChpID0g
MDsgaSA8IEFNREdQVV9IV19JUF9OVU07ICsraSkgewo+ICAgCQlzdHJ1Y3QgYW1kZ3B1X3Jpbmcg
KnJpbmdzW0FNREdQVV9NQVhfUklOR1NdOwo+IC0JCXN0cnVjdCBkcm1fc2NoZWRfcnEgKnJxc1tB
TURHUFVfTUFYX1JJTkdTXTsKPiArCQlzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkX2xp
c3RbQU1ER1BVX01BWF9SSU5HU107Cj4gICAJCXVuc2lnbmVkIG51bV9yaW5ncyA9IDA7Cj4gICAJ
CXVuc2lnbmVkIG51bV9ycXMgPSAwOwo+ICAgCj4gQEAgLTE4MSwxMiArMTgxLDEzIEBAIHN0YXRp
YyBpbnQgYW1kZ3B1X2N0eF9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAgCQkJ
aWYgKCFyaW5nc1tqXS0+YWRldikKPiAgIAkJCQljb250aW51ZTsKPiAgIAo+IC0JCQlycXNbbnVt
X3JxcysrXSA9ICZyaW5nc1tqXS0+c2NoZWQuc2NoZWRfcnFbcHJpb3JpdHldOwo+ICsJCQlzY2hl
ZF9saXN0W251bV9ycXMrK10gPSAmcmluZ3Nbal0tPnNjaGVkOwo+ICAgCQl9Cj4gICAKPiAgIAkJ
Zm9yIChqID0gMDsgaiA8IGFtZGdwdV9jdHhfbnVtX2VudGl0aWVzW2ldOyArK2opCj4gICAJCQly
ID0gZHJtX3NjaGVkX2VudGl0eV9pbml0KCZjdHgtPmVudGl0aWVzW2ldW2pdLmVudGl0eSwKPiAt
CQkJCQkJICBycXMsIG51bV9ycXMsICZjdHgtPmd1aWx0eSk7Cj4gKwkJCQkJCSAgcHJpb3JpdHks
IHNjaGVkX2xpc3QsCj4gKwkJCQkJCSAgbnVtX3JxcywgJmN0eC0+Z3VpbHR5KTsKPiAgIAkJaWYg
KHIpCj4gICAJCQlnb3RvIGVycm9yX2NsZWFudXBfZW50aXRpZXM7Cj4gICAJfQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKPiBpbmRleCAxOWZmZTAwZDkwNzIuLjJiNmUz
NTg5MzkxOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dHRtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKPiBA
QCAtMTk1NywxMSArMTk1NywxMyBAQCB2b2lkIGFtZGdwdV90dG1fc2V0X2J1ZmZlcl9mdW5jc19z
dGF0dXMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGJvb2wgZW5hYmxlKQo+ICAgCj4gICAJ
aWYgKGVuYWJsZSkgewo+ICAgCQlzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmc7Cj4gLQkJc3RydWN0
IGRybV9zY2hlZF9ycSAqcnE7Cj4gKwkJc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZDsK
PiAgIAo+ICAgCQlyaW5nID0gYWRldi0+bW1hbi5idWZmZXJfZnVuY3NfcmluZzsKPiAtCQlycSA9
ICZyaW5nLT5zY2hlZC5zY2hlZF9ycVtEUk1fU0NIRURfUFJJT1JJVFlfS0VSTkVMXTsKPiAtCQly
ID0gZHJtX3NjaGVkX2VudGl0eV9pbml0KCZhZGV2LT5tbWFuLmVudGl0eSwgJnJxLCAxLCBOVUxM
KTsKPiArCQlzY2hlZCA9ICZyaW5nLT5zY2hlZDsKPiArCQlyID0gZHJtX3NjaGVkX2VudGl0eV9p
bml0KCZhZGV2LT5tbWFuLmVudGl0eSwKPiArCQkJCSAgICAgICAgICBEUk1fU0NIRURfUFJJT1JJ
VFlfS0VSTkVMLCAmc2NoZWQsCj4gKwkJCQkJICAxLCBOVUxMKTsKPiAgIAkJaWYgKHIpIHsKPiAg
IAkJCURSTV9FUlJPUigiRmFpbGVkIHNldHRpbmcgdXAgVFRNIEJPIG1vdmUgZW50aXR5ICglZClc
biIsCj4gICAJCQkJICByKTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3V2ZC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3V2ZC5j
Cj4gaW5kZXggZTMyNGJmZTZjNThmLi5hMWExMTBmNTUxM2QgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3V2ZC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3V2ZC5jCj4gQEAgLTMzMCwxMiArMzMwLDEzIEBAIGludCBhbWRn
cHVfdXZkX3N3X2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICBpbnQgYW1kZ3B1
X3V2ZF9lbnRpdHlfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgIHsKPiAgIAlz
dHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmc7Cj4gLQlzdHJ1Y3QgZHJtX3NjaGVkX3JxICpycTsKPiAr
CXN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQ7Cj4gICAJaW50IHI7Cj4gICAKPiAgIAly
aW5nID0gJmFkZXYtPnV2ZC5pbnN0WzBdLnJpbmc7Cj4gLQlycSA9ICZyaW5nLT5zY2hlZC5zY2hl
ZF9ycVtEUk1fU0NIRURfUFJJT1JJVFlfTk9STUFMXTsKPiAtCXIgPSBkcm1fc2NoZWRfZW50aXR5
X2luaXQoJmFkZXYtPnV2ZC5lbnRpdHksICZycSwgMSwgTlVMTCk7Cj4gKwlzY2hlZCA9ICZyaW5n
LT5zY2hlZDsKPiArCXIgPSBkcm1fc2NoZWRfZW50aXR5X2luaXQoJmFkZXYtPnV2ZC5lbnRpdHks
IERSTV9TQ0hFRF9QUklPUklUWV9OT1JNQUwsCj4gKwkJCQkgICZzY2hlZCwgMSwgTlVMTCk7Cj4g
ICAJaWYgKHIpIHsKPiAgIAkJRFJNX0VSUk9SKCJGYWlsZWQgc2V0dGluZyB1cCBVVkQga2VybmVs
IGVudGl0eS5cbiIpOwo+ICAgCQlyZXR1cm4gcjsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3ZjZS5jCj4gaW5kZXggNDZiNTkwYWYyZmQyLi5jZWIwZGJmNjg1ZjEgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZjZS5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZjZS5jCj4gQEAgLTI0MCwxMiArMjQwLDEz
IEBAIGludCBhbWRncHVfdmNlX3N3X2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4g
ICBpbnQgYW1kZ3B1X3ZjZV9lbnRpdHlfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikK
PiAgIHsKPiAgIAlzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmc7Cj4gLQlzdHJ1Y3QgZHJtX3NjaGVk
X3JxICpycTsKPiArCXN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQ7Cj4gICAJaW50IHI7
Cj4gICAKPiAgIAlyaW5nID0gJmFkZXYtPnZjZS5yaW5nWzBdOwo+IC0JcnEgPSAmcmluZy0+c2No
ZWQuc2NoZWRfcnFbRFJNX1NDSEVEX1BSSU9SSVRZX05PUk1BTF07Cj4gLQlyID0gZHJtX3NjaGVk
X2VudGl0eV9pbml0KCZhZGV2LT52Y2UuZW50aXR5LCAmcnEsIDEsIE5VTEwpOwo+ICsJc2NoZWQg
PSAmcmluZy0+c2NoZWQ7Cj4gKwlyID0gZHJtX3NjaGVkX2VudGl0eV9pbml0KCZhZGV2LT52Y2Uu
ZW50aXR5LCBEUk1fU0NIRURfUFJJT1JJVFlfTk9STUFMLAo+ICsJCQkJICAmc2NoZWQsIDEsIE5V
TEwpOwo+ICAgCWlmIChyICE9IDApIHsKPiAgIAkJRFJNX0VSUk9SKCJGYWlsZWQgc2V0dGluZyB1
cCBWQ0UgcnVuIHF1ZXVlLlxuIik7Cj4gICAJCXJldHVybiByOwo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92bS5jCj4gaW5kZXggYTk0YzRmYWE1YWYxLi5hYzg5OWViMzVkNTUgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+IEBAIC0yNjg3LDYgKzI2
ODcsNyBAQCBpbnQgYW1kZ3B1X3ZtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0
cnVjdCBhbWRncHVfdm0gKnZtLAo+ICAgewo+ICAgCXN0cnVjdCBhbWRncHVfYm9fcGFyYW0gYnA7
Cj4gICAJc3RydWN0IGFtZGdwdV9ibyAqcm9vdDsKPiArICAgICAgICBzdHJ1Y3QgZHJtX2dwdV9z
Y2hlZHVsZXIgKnNjaGVkX2xpc3RbQU1ER1BVX01BWF9SSU5HU107Cldyb25nIGluZGVudGF0aW9u
LCBTZW50IGEgdjIgZm9yIHRoYXQKPiAgIAlpbnQgciwgaTsKPiAgIAo+ICAgCXZtLT52YSA9IFJC
X1JPT1RfQ0FDSEVEOwo+IEBAIC0yNzAwLDE0ICsyNzAxLDE5IEBAIGludCBhbWRncHVfdm1faW5p
dChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IGFtZGdwdV92bSAqdm0sCj4gICAJ
c3Bpbl9sb2NrX2luaXQoJnZtLT5pbnZhbGlkYXRlZF9sb2NrKTsKPiAgIAlJTklUX0xJU1RfSEVB
RCgmdm0tPmZyZWVkKTsKPiAgIAo+ICsgICAgICAgIGZvciAoaSA9IDA7IGkgPCBhZGV2LT52bV9t
YW5hZ2VyLnZtX3B0ZV9udW1fcnFzOyBpKyspCj4gKwkgICAgICAgc2NoZWRfbGlzdFtpXSA9IGFk
ZXYtPnZtX21hbmFnZXIudm1fcHRlX3Jxc1tpXS0+c2NoZWQ7ClNhbWUgaGVyZQo+ICsKPiAgIAkv
KiBjcmVhdGUgc2NoZWR1bGVyIGVudGl0aWVzIGZvciBwYWdlIHRhYmxlIHVwZGF0ZXMgKi8KPiAt
CXIgPSBkcm1fc2NoZWRfZW50aXR5X2luaXQoJnZtLT5kaXJlY3QsIGFkZXYtPnZtX21hbmFnZXIu
dm1fcHRlX3JxcywKPiAtCQkJCSAgYWRldi0+dm1fbWFuYWdlci52bV9wdGVfbnVtX3JxcywgTlVM
TCk7Cj4gKwlyID0gZHJtX3NjaGVkX2VudGl0eV9pbml0KCZ2bS0+ZGlyZWN0LCBEUk1fU0NIRURf
UFJJT1JJVFlfTk9STUFMLAo+ICsJCQkJICBzY2hlZF9saXN0LCBhZGV2LT52bV9tYW5hZ2VyLnZt
X3B0ZV9udW1fcnFzLAo+ICsJCQkJICBOVUxMKTsKPiAgIAlpZiAocikKPiAgIAkJcmV0dXJuIHI7
Cj4gICAKPiAtCXIgPSBkcm1fc2NoZWRfZW50aXR5X2luaXQoJnZtLT5kZWxheWVkLCBhZGV2LT52
bV9tYW5hZ2VyLnZtX3B0ZV9ycXMsCj4gLQkJCQkgIGFkZXYtPnZtX21hbmFnZXIudm1fcHRlX251
bV9ycXMsIE5VTEwpOwo+ICsJciA9IGRybV9zY2hlZF9lbnRpdHlfaW5pdCgmdm0tPmRlbGF5ZWQs
IERSTV9TQ0hFRF9QUklPUklUWV9OT1JNQUwsCj4gKwkJCQkgIHNjaGVkX2xpc3QsIGFkZXYtPnZt
X21hbmFnZXIudm1fcHRlX251bV9ycXMsCj4gKwkJCQkgIE5VTEwpOwo+ICAgCWlmIChyKQo+ICAg
CQlnb3RvIGVycm9yX2ZyZWVfZGlyZWN0Owo+ICAgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9ldG5hdml2L2V0bmF2aXZfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5h
dml2X2Rydi5jCj4gaW5kZXggMWY5YzAxYmU0MGQ3Li43NmVjZGY4YmQzMWMgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kcnYuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZHJ2LmMKPiBAQCAtNjUsMTIgKzY1LDEzIEBAIHN0YXRp
YyBpbnQgZXRuYXZpdl9vcGVuKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fZmls
ZSAqZmlsZSkKPiAgIAo+ICAgCWZvciAoaSA9IDA7IGkgPCBFVE5BX01BWF9QSVBFUzsgaSsrKSB7
Cj4gICAJCXN0cnVjdCBldG5hdml2X2dwdSAqZ3B1ID0gcHJpdi0+Z3B1W2ldOwo+IC0JCXN0cnVj
dCBkcm1fc2NoZWRfcnEgKnJxOwo+ICsJCXN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQ7
Cj4gICAKPiAgIAkJaWYgKGdwdSkgewo+IC0JCQlycSA9ICZncHUtPnNjaGVkLnNjaGVkX3JxW0RS
TV9TQ0hFRF9QUklPUklUWV9OT1JNQUxdOwo+ICsJCQlzY2hlZCA9ICZncHUtPnNjaGVkOwo+ICAg
CQkJZHJtX3NjaGVkX2VudGl0eV9pbml0KCZjdHgtPnNjaGVkX2VudGl0eVtpXSwKPiAtCQkJCQkg
ICAgICAmcnEsIDEsIE5VTEwpOwo+ICsJCQkJCSAgICAgIERSTV9TQ0hFRF9QUklPUklUWV9OT1JN
QUwsICZzY2hlZCwKPiArCQkJCQkgICAgICAxLCBOVUxMKTsKPiAgIAkJCX0KPiAgIAl9Cj4gICAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9zY2hlZC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2xpbWEvbGltYV9zY2hlZC5jCj4gaW5kZXggZjUyMmM1Zjk5NzI5Li5mYzgzNjJl
NDE0OWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9zY2hlZC5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9zY2hlZC5jCj4gQEAgLTE1OSw5ICsxNTks
MTAgQEAgaW50IGxpbWFfc2NoZWRfY29udGV4dF9pbml0KHN0cnVjdCBsaW1hX3NjaGVkX3BpcGUg
KnBpcGUsCj4gICAJCQkgICAgc3RydWN0IGxpbWFfc2NoZWRfY29udGV4dCAqY29udGV4dCwKPiAg
IAkJCSAgICBhdG9taWNfdCAqZ3VpbHR5KQo+ICAgewo+IC0Jc3RydWN0IGRybV9zY2hlZF9ycSAq
cnEgPSBwaXBlLT5iYXNlLnNjaGVkX3JxICsgRFJNX1NDSEVEX1BSSU9SSVRZX05PUk1BTDsKPiAr
CXN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQgPSAmcGlwZS0+YmFzZTsKPiAgIAo+IC0J
cmV0dXJuIGRybV9zY2hlZF9lbnRpdHlfaW5pdCgmY29udGV4dC0+YmFzZSwgJnJxLCAxLCBndWls
dHkpOwo+ICsJcmV0dXJuIGRybV9zY2hlZF9lbnRpdHlfaW5pdCgmY29udGV4dC0+YmFzZSwgRFJN
X1NDSEVEX1BSSU9SSVRZX05PUk1BTCwKPiArCQkJCSAgICAgJnNjaGVkLCAxLCBndWlsdHkpOwo+
ICAgfQo+ICAgCj4gICB2b2lkIGxpbWFfc2NoZWRfY29udGV4dF9maW5pKHN0cnVjdCBsaW1hX3Nj
aGVkX3BpcGUgKnBpcGUsCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9w
YW5mcm9zdF9qb2IuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYwo+
IGluZGV4IGQ0MTFlYjZjOGViOS4uNGY5YWU1YTEyMDkwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9wYW5mcm9zdF9qb2IuYwo+IEBAIC01NDIsMTIgKzU0MiwxNCBAQCBpbnQgcGFuZnJv
c3Rfam9iX29wZW4oc3RydWN0IHBhbmZyb3N0X2ZpbGVfcHJpdiAqcGFuZnJvc3RfcHJpdikKPiAg
IHsKPiAgIAlzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldiA9IHBhbmZyb3N0X3ByaXYtPnBm
ZGV2Owo+ICAgCXN0cnVjdCBwYW5mcm9zdF9qb2Jfc2xvdCAqanMgPSBwZmRldi0+anM7Cj4gLQlz
dHJ1Y3QgZHJtX3NjaGVkX3JxICpycTsKPiArCXN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2No
ZWQ7Cj4gICAJaW50IHJldCwgaTsKPiAgIAo+ICAgCWZvciAoaSA9IDA7IGkgPCBOVU1fSk9CX1NM
T1RTOyBpKyspIHsKPiAtCQlycSA9ICZqcy0+cXVldWVbaV0uc2NoZWQuc2NoZWRfcnFbRFJNX1ND
SEVEX1BSSU9SSVRZX05PUk1BTF07Cj4gLQkJcmV0ID0gZHJtX3NjaGVkX2VudGl0eV9pbml0KCZw
YW5mcm9zdF9wcml2LT5zY2hlZF9lbnRpdHlbaV0sICZycSwgMSwgTlVMTCk7Cj4gKwkJc2NoZWQg
PSAmanMtPnF1ZXVlW2ldLnNjaGVkOwo+ICsJCXJldCA9IGRybV9zY2hlZF9lbnRpdHlfaW5pdCgm
cGFuZnJvc3RfcHJpdi0+c2NoZWRfZW50aXR5W2ldLAo+ICsJCQkJCSAgICBEUk1fU0NIRURfUFJJ
T1JJVFlfTk9STUFMLCAmc2NoZWQsCj4gKwkJCQkJICAgIDEsIE5VTEwsIERSTV9TQ0hFRF9QUklP
UklUWV9OT1JNQUwpOwo+ICAgCQlpZiAoV0FSTl9PTihyZXQpKQo+ICAgCQkJcmV0dXJuIHJldDsK
PiAgIAl9Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50
aXR5LmMgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jCj4gaW5kZXgg
NDYxYTdhODEyOWY0Li5jNDdmYjJmYmU2OGIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVs
ZXIvc2NoZWRfZW50aXR5LmMKPiBAQCAtMzgsOSArMzgsMTAgQEAKPiAgICAqIHN1Ym1pdCB0byBI
VyByaW5nLgo+ICAgICoKPiAgICAqIEBlbnRpdHk6IHNjaGVkdWxlciBlbnRpdHkgdG8gaW5pdAo+
IC0gKiBAcnFfbGlzdDogdGhlIGxpc3Qgb2YgcnVuIHF1ZXVlIG9uIHdoaWNoIGpvYnMgZnJvbSB0
aGlzCj4gKyAqIEBwcmlvcml0eTogcHJpb3JpdHkgb2YgdGhlIGVudGl0eQo+ICsgKiBAc2NoZWRf
bGlzdDogdGhlIGxpc3Qgb2YgZHJtIHNjaGVkcyBvbiB3aGljaCBqb2JzIGZyb20gdGhpcwo+ICAg
ICogICAgICAgICAgIGVudGl0eSBjYW4gYmUgc3VibWl0dGVkCj4gLSAqIEBudW1fcnFfbGlzdDog
bnVtYmVyIG9mIHJ1biBxdWV1ZSBpbiBycV9saXN0Cj4gKyAqIEBudW1fc2NoZWRfbGlzdDogbnVt
YmVyIG9mIGRybSBzY2hlZCBpbiBzY2hlZF9saXN0Cj4gICAgKiBAZ3VpbHR5OiBhdG9taWNfdCBz
ZXQgdG8gMSB3aGVuIGEgam9iIG9uIHRoaXMgcXVldWUKPiAgICAqICAgICAgICAgIGlzIGZvdW5k
IHRvIGJlIGd1aWx0eSBjYXVzaW5nIGEgdGltZW91dAo+ICAgICoKPiBAQCAtNTAsMzIgKzUxLDM1
IEBACj4gICAgKiBSZXR1cm5zIDAgb24gc3VjY2VzcyBvciBhIG5lZ2F0aXZlIGVycm9yIGNvZGUg
b24gZmFpbHVyZS4KPiAgICAqLwo+ICAgaW50IGRybV9zY2hlZF9lbnRpdHlfaW5pdChzdHJ1Y3Qg
ZHJtX3NjaGVkX2VudGl0eSAqZW50aXR5LAo+IC0JCQkgIHN0cnVjdCBkcm1fc2NoZWRfcnEgKipy
cV9saXN0LAo+IC0JCQkgIHVuc2lnbmVkIGludCBudW1fcnFfbGlzdCwKPiArCQkJICBlbnVtIGRy
bV9zY2hlZF9wcmlvcml0eSBwcmlvcml0eSwKPiArCQkJICBzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVs
ZXIgKipzY2hlZF9saXN0LAo+ICsJCQkgIHVuc2lnbmVkIGludCBudW1fc2NoZWRfbGlzdCwKPiAg
IAkJCSAgYXRvbWljX3QgKmd1aWx0eSkKPiAgIHsKPiAgIAlpbnQgaTsKPiAgIAo+IC0JaWYgKCEo
ZW50aXR5ICYmIHJxX2xpc3QgJiYgKG51bV9ycV9saXN0ID09IDAgfHwgcnFfbGlzdFswXSkpKQo+
ICsJaWYgKCEoZW50aXR5ICYmIHNjaGVkX2xpc3QgJiYgKG51bV9zY2hlZF9saXN0ID09IDAgfHwg
c2NoZWRfbGlzdFswXSkpKQo+ICAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgIAo+ICAgCW1lbXNldChl
bnRpdHksIDAsIHNpemVvZihzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSkpOwo+ICAgCUlOSVRfTElT
VF9IRUFEKCZlbnRpdHktPmxpc3QpOwo+ICAgCWVudGl0eS0+cnEgPSBOVUxMOwo+ICAgCWVudGl0
eS0+Z3VpbHR5ID0gZ3VpbHR5Owo+IC0JZW50aXR5LT5udW1fcnFfbGlzdCA9IG51bV9ycV9saXN0
Owo+IC0JZW50aXR5LT5ycV9saXN0ID0ga2NhbGxvYyhudW1fcnFfbGlzdCwgc2l6ZW9mKHN0cnVj
dCBkcm1fc2NoZWRfcnEgKiksCj4gLQkJCQlHRlBfS0VSTkVMKTsKPiAtCWlmICghZW50aXR5LT5y
cV9saXN0KQo+ICsJZW50aXR5LT5udW1fc2NoZWRfbGlzdCA9IG51bV9zY2hlZF9saXN0Owo+ICsJ
ZW50aXR5LT5wcmlvcml0eSA9IHByaW9yaXR5Owo+ICsJZW50aXR5LT5zY2hlZF9saXN0ID0gIGtj
YWxsb2MobnVtX3NjaGVkX2xpc3QsCj4gKwkJCQkgICAgICBzaXplb2Yoc3RydWN0IGRybV9ncHVf
c2NoZWR1bGVyICopLCBHRlBfS0VSTkVMKTsKPiArCj4gKwlpZighZW50aXR5LT5zY2hlZF9saXN0
KQo+ICAgCQlyZXR1cm4gLUVOT01FTTsKPiAgIAo+ICAgCWluaXRfY29tcGxldGlvbigmZW50aXR5
LT5lbnRpdHlfaWRsZSk7Cj4gICAKPiAtCWZvciAoaSA9IDA7IGkgPCBudW1fcnFfbGlzdDsgKytp
KQo+IC0JCWVudGl0eS0+cnFfbGlzdFtpXSA9IHJxX2xpc3RbaV07Cj4gKwlmb3IgKGkgPSAwOyBp
IDwgbnVtX3NjaGVkX2xpc3Q7IGkrKykKPiArCQllbnRpdHktPnNjaGVkX2xpc3RbaV0gPSBzY2hl
ZF9saXN0W2ldOwo+ICAgCj4gLQlpZiAobnVtX3JxX2xpc3QpCj4gLQkJZW50aXR5LT5ycSA9IHJx
X2xpc3RbMF07Cj4gKwlpZiAobnVtX3NjaGVkX2xpc3QpCj4gKwkJZW50aXR5LT5ycSA9ICZlbnRp
dHktPnNjaGVkX2xpc3RbMF0tPnNjaGVkX3JxW2VudGl0eS0+cHJpb3JpdHldOwo+ICAgCj4gICAJ
ZW50aXR5LT5sYXN0X3NjaGVkdWxlZCA9IE5VTEw7Cj4gICAKPiBAQCAtMTM5LDEwICsxNDMsMTAg
QEAgZHJtX3NjaGVkX2VudGl0eV9nZXRfZnJlZV9zY2hlZChzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0
eSAqZW50aXR5KQo+ICAgCXVuc2lnbmVkIGludCBtaW5fam9icyA9IFVJTlRfTUFYLCBudW1fam9i
czsKPiAgIAlpbnQgaTsKPiAgIAo+IC0JZm9yIChpID0gMDsgaSA8IGVudGl0eS0+bnVtX3JxX2xp
c3Q7ICsraSkgewo+IC0JCXN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQgPSBlbnRpdHkt
PnJxX2xpc3RbaV0tPnNjaGVkOwo+ICsJZm9yIChpID0gMDsgaSA8IGVudGl0eS0+bnVtX3NjaGVk
X2xpc3Q7ICsraSkgewo+ICsJCXN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQgPSBlbnRp
dHktPnNjaGVkX2xpc3RbaV07Cj4gICAKPiAtCQlpZiAoIWVudGl0eS0+cnFfbGlzdFtpXS0+c2No
ZWQtPnJlYWR5KSB7Cj4gKwkJaWYgKCFlbnRpdHktPnNjaGVkX2xpc3RbaV0tPnJlYWR5KSB7Cj4g
ICAJCQlEUk1fV0FSTigic2NoZWQlcyBpcyBub3QgcmVhZHksIHNraXBwaW5nIiwgc2NoZWQtPm5h
bWUpOwo+ICAgCQkJY29udGludWU7Cj4gICAJCX0KPiBAQCAtMTUwLDcgKzE1NCw3IEBAIGRybV9z
Y2hlZF9lbnRpdHlfZ2V0X2ZyZWVfc2NoZWQoc3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0
eSkKPiAgIAkJbnVtX2pvYnMgPSBhdG9taWNfcmVhZCgmc2NoZWQtPm51bV9qb2JzKTsKPiAgIAkJ
aWYgKG51bV9qb2JzIDwgbWluX2pvYnMpIHsKPiAgIAkJCW1pbl9qb2JzID0gbnVtX2pvYnM7Cj4g
LQkJCXJxID0gZW50aXR5LT5ycV9saXN0W2ldOwo+ICsJCQlycSA9ICZlbnRpdHktPnNjaGVkX2xp
c3RbaV0tPnNjaGVkX3JxW2VudGl0eS0+cHJpb3JpdHldOwo+ICAgCQl9Cj4gICAJfQo+ICAgCj4g
QEAgLTMwOCw3ICszMTIsNyBAQCB2b2lkIGRybV9zY2hlZF9lbnRpdHlfZmluaShzdHJ1Y3QgZHJt
X3NjaGVkX2VudGl0eSAqZW50aXR5KQo+ICAgCj4gICAJZG1hX2ZlbmNlX3B1dChlbnRpdHktPmxh
c3Rfc2NoZWR1bGVkKTsKPiAgIAllbnRpdHktPmxhc3Rfc2NoZWR1bGVkID0gTlVMTDsKPiAtCWtm
cmVlKGVudGl0eS0+cnFfbGlzdCk7Cj4gKwlrZnJlZShlbnRpdHktPnNjaGVkX2xpc3QpOwo+ICAg
fQo+ICAgRVhQT1JUX1NZTUJPTChkcm1fc2NoZWRfZW50aXR5X2ZpbmkpOwo+ICAgCj4gQEAgLTM1
MywxNSArMzU3LDYgQEAgc3RhdGljIHZvaWQgZHJtX3NjaGVkX2VudGl0eV93YWtldXAoc3RydWN0
IGRtYV9mZW5jZSAqZiwKPiAgIAlkcm1fc2NoZWRfd2FrZXVwKGVudGl0eS0+cnEtPnNjaGVkKTsK
PiAgIH0KPiAgIAo+IC0vKioKPiAtICogZHJtX3NjaGVkX2VudGl0eV9zZXRfcnFfcHJpb3JpdHkg
LSBoZWxwZXIgZm9yIGRybV9zY2hlZF9lbnRpdHlfc2V0X3ByaW9yaXR5Cj4gLSAqLwo+IC1zdGF0
aWMgdm9pZCBkcm1fc2NoZWRfZW50aXR5X3NldF9ycV9wcmlvcml0eShzdHJ1Y3QgZHJtX3NjaGVk
X3JxICoqcnEsCj4gLQkJCQkJICAgICBlbnVtIGRybV9zY2hlZF9wcmlvcml0eSBwcmlvcml0eSkK
PiAtewo+IC0JKnJxID0gJigqcnEpLT5zY2hlZC0+c2NoZWRfcnFbcHJpb3JpdHldOwo+IC19Cj4g
LQo+ICAgLyoqCj4gICAgKiBkcm1fc2NoZWRfZW50aXR5X3NldF9wcmlvcml0eSAtIFNldHMgcHJp
b3JpdHkgb2YgdGhlIGVudGl0eQo+ICAgICoKPiBAQCAtMzczLDE5ICszNjgsOCBAQCBzdGF0aWMg
dm9pZCBkcm1fc2NoZWRfZW50aXR5X3NldF9ycV9wcmlvcml0eShzdHJ1Y3QgZHJtX3NjaGVkX3Jx
ICoqcnEsCj4gICB2b2lkIGRybV9zY2hlZF9lbnRpdHlfc2V0X3ByaW9yaXR5KHN0cnVjdCBkcm1f
c2NoZWRfZW50aXR5ICplbnRpdHksCj4gICAJCQkJICAgZW51bSBkcm1fc2NoZWRfcHJpb3JpdHkg
cHJpb3JpdHkpCj4gICB7Cj4gLQl1bnNpZ25lZCBpbnQgaTsKPiAtCj4gICAJc3Bpbl9sb2NrKCZl
bnRpdHktPnJxX2xvY2spOwo+IC0KPiAtCWZvciAoaSA9IDA7IGkgPCBlbnRpdHktPm51bV9ycV9s
aXN0OyArK2kpCj4gLQkJZHJtX3NjaGVkX2VudGl0eV9zZXRfcnFfcHJpb3JpdHkoJmVudGl0eS0+
cnFfbGlzdFtpXSwgcHJpb3JpdHkpOwo+IC0KPiAtCWlmIChlbnRpdHktPnJxKSB7Cj4gLQkJZHJt
X3NjaGVkX3JxX3JlbW92ZV9lbnRpdHkoZW50aXR5LT5ycSwgZW50aXR5KTsKPiAtCQlkcm1fc2No
ZWRfZW50aXR5X3NldF9ycV9wcmlvcml0eSgmZW50aXR5LT5ycSwgcHJpb3JpdHkpOwo+IC0JCWRy
bV9zY2hlZF9ycV9hZGRfZW50aXR5KGVudGl0eS0+cnEsIGVudGl0eSk7Cj4gLQl9Cj4gLQo+ICsJ
ZW50aXR5LT5wcmlvcml0eSA9IHByaW9yaXR5Owo+ICAgCXNwaW5fdW5sb2NrKCZlbnRpdHktPnJx
X2xvY2spOwo+ICAgfQo+ICAgRVhQT1JUX1NZTUJPTChkcm1fc2NoZWRfZW50aXR5X3NldF9wcmlv
cml0eSk7Cj4gQEAgLTQ5MCwxOCArNDc0LDIwIEBAIHZvaWQgZHJtX3NjaGVkX2VudGl0eV9zZWxl
Y3RfcnEoc3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0eSkKPiAgIAlzdHJ1Y3QgZG1hX2Zl
bmNlICpmZW5jZTsKPiAgIAlzdHJ1Y3QgZHJtX3NjaGVkX3JxICpycTsKPiAgIAo+IC0JaWYgKHNw
c2NfcXVldWVfY291bnQoJmVudGl0eS0+am9iX3F1ZXVlKSB8fCBlbnRpdHktPm51bV9ycV9saXN0
IDw9IDEpCj4gKwlpZiAoc3BzY19xdWV1ZV9jb3VudCgmZW50aXR5LT5qb2JfcXVldWUpIHx8IGVu
dGl0eS0+bnVtX3NjaGVkX2xpc3QgPD0gMSkKPiAgIAkJcmV0dXJuOwo+ICAgCj4gICAJZmVuY2Ug
PSBSRUFEX09OQ0UoZW50aXR5LT5sYXN0X3NjaGVkdWxlZCk7Cj4gICAJaWYgKGZlbmNlICYmICFk
bWFfZmVuY2VfaXNfc2lnbmFsZWQoZmVuY2UpKQo+ICAgCQlyZXR1cm47Cj4gICAKPiArCXNwaW5f
bG9jaygmZW50aXR5LT5ycV9sb2NrKTsKPiAgIAlycSA9IGRybV9zY2hlZF9lbnRpdHlfZ2V0X2Zy
ZWVfc2NoZWQoZW50aXR5KTsKPiAtCWlmIChycSA9PSBlbnRpdHktPnJxKQo+ICsJaWYgKHJxID09
IGVudGl0eS0+cnEpIHsKPiArCQlzcGluX3VubG9jaygmZW50aXR5LT5ycV9sb2NrKTsKPiAgIAkJ
cmV0dXJuOwo+ICsJfQo+ICAgCj4gLQlzcGluX2xvY2soJmVudGl0eS0+cnFfbG9jayk7Cj4gICAJ
ZHJtX3NjaGVkX3JxX3JlbW92ZV9lbnRpdHkoZW50aXR5LT5ycSwgZW50aXR5KTsKPiAgIAllbnRp
dHktPnJxID0gcnE7Cj4gICAJc3Bpbl91bmxvY2soJmVudGl0eS0+cnFfbG9jayk7Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3Yz
ZC92M2RfZHJ2LmMKPiBpbmRleCAxYTA3NDYyYjQ1MjguLmVhYThlOTY4MjM3MyAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS92M2QvdjNkX2Rydi5jCj4gQEAgLTE0MCw3ICsxNDAsNyBAQCB2M2Rfb3BlbihzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUpCj4gICB7Cj4gICAJc3RydWN0IHYz
ZF9kZXYgKnYzZCA9IHRvX3YzZF9kZXYoZGV2KTsKPiAgIAlzdHJ1Y3QgdjNkX2ZpbGVfcHJpdiAq
djNkX3ByaXY7Cj4gLQlzdHJ1Y3QgZHJtX3NjaGVkX3JxICpycTsKPiArCXN0cnVjdCBkcm1fZ3B1
X3NjaGVkdWxlciAqc2NoZWQ7Cj4gICAJaW50IGk7Cj4gICAKPiAgIAl2M2RfcHJpdiA9IGt6YWxs
b2Moc2l6ZW9mKCp2M2RfcHJpdiksIEdGUF9LRVJORUwpOwo+IEBAIC0xNTAsOCArMTUwLDEwIEBA
IHYzZF9vcGVuKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSkK
PiAgIAl2M2RfcHJpdi0+djNkID0gdjNkOwo+ICAgCj4gICAJZm9yIChpID0gMDsgaSA8IFYzRF9N
QVhfUVVFVUVTOyBpKyspIHsKPiAtCQlycSA9ICZ2M2QtPnF1ZXVlW2ldLnNjaGVkLnNjaGVkX3Jx
W0RSTV9TQ0hFRF9QUklPUklUWV9OT1JNQUxdOwo+IC0JCWRybV9zY2hlZF9lbnRpdHlfaW5pdCgm
djNkX3ByaXYtPnNjaGVkX2VudGl0eVtpXSwgJnJxLCAxLCBOVUxMKTsKPiArCQlzY2hlZCA9ICZ2
M2QtPnF1ZXVlW2ldLnNjaGVkOwo+ICsJCWRybV9zY2hlZF9lbnRpdHlfaW5pdCgmdjNkX3ByaXYt
PnNjaGVkX2VudGl0eVtpXSwKPiArCQkJCSAgICAgIERSTV9TQ0hFRF9QUklPUklUWV9OT1JNQUws
ICZzY2hlZCwKPiArCQkJCSAgICAgIDEsIE5VTEwpOwo+ICAgCX0KPiAgIAo+ICAgCWZpbGUtPmRy
aXZlcl9wcml2ID0gdjNkX3ByaXY7Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2dwdV9zY2hl
ZHVsZXIuaCBiL2luY2x1ZGUvZHJtL2dwdV9zY2hlZHVsZXIuaAo+IGluZGV4IDY4NDY5MmE4ZWQ3
Ni4uOTZhMWExYjc1MjZlIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2dwdV9zY2hlZHVsZXIu
aAo+ICsrKyBiL2luY2x1ZGUvZHJtL2dwdV9zY2hlZHVsZXIuaAo+IEBAIC04MSw4ICs4MSw5IEBA
IGVudW0gZHJtX3NjaGVkX3ByaW9yaXR5IHsKPiAgIHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5IHsK
PiAgIAlzdHJ1Y3QgbGlzdF9oZWFkCQlsaXN0Owo+ICAgCXN0cnVjdCBkcm1fc2NoZWRfcnEJCSpy
cTsKPiAtCXN0cnVjdCBkcm1fc2NoZWRfcnEJCSoqcnFfbGlzdDsKPiAtCXVuc2lnbmVkIGludCAg
ICAgICAgICAgICAgICAgICAgbnVtX3JxX2xpc3Q7Cj4gKwl1bnNpZ25lZCBpbnQgICAgICAgICAg
ICAgICAgICAgIG51bV9zY2hlZF9saXN0Owo+ICsJc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICAg
ICAgICAqKnNjaGVkX2xpc3Q7Cj4gKwllbnVtIGRybV9zY2hlZF9wcmlvcml0eSAgICAgICAgIHBy
aW9yaXR5Owo+ICAgCXNwaW5sb2NrX3QJCQlycV9sb2NrOwo+ICAgCj4gICAJc3RydWN0IHNwc2Nf
cXVldWUJCWpvYl9xdWV1ZTsKPiBAQCAtMzEyLDcgKzMxMyw4IEBAIHZvaWQgZHJtX3NjaGVkX3Jx
X3JlbW92ZV9lbnRpdHkoc3RydWN0IGRybV9zY2hlZF9ycSAqcnEsCj4gICAJCQkJc3RydWN0IGRy
bV9zY2hlZF9lbnRpdHkgKmVudGl0eSk7Cj4gICAKPiAgIGludCBkcm1fc2NoZWRfZW50aXR5X2lu
aXQoc3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0eSwKPiAtCQkJICBzdHJ1Y3QgZHJtX3Nj
aGVkX3JxICoqcnFfbGlzdCwKPiArCQkJICBlbnVtIGRybV9zY2hlZF9wcmlvcml0eSBwcmlvcml0
eSwKPiArCQkJICBzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKipzY2hlZF9saXN0LAo+ICAgCQkJ
ICB1bnNpZ25lZCBpbnQgbnVtX3JxX2xpc3QsCj4gICAJCQkgIGF0b21pY190ICpndWlsdHkpOwo+
ICAgbG9uZyBkcm1fc2NoZWRfZW50aXR5X2ZsdXNoKHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5ICpl
bnRpdHksIGxvbmcgdGltZW91dCk7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
