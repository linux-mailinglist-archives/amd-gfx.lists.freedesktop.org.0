Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA0D7A440
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jul 2019 11:34:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D2C6E46B;
	Tue, 30 Jul 2019 09:34:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690054.outbound.protection.outlook.com [40.107.69.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2266A89CA2
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jul 2019 09:34:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMGuq3oJj5DegNRz39ytT/5vKU+VLVxN6CO9DxvKZf993y2FUgCfTbyRUTKl6yPp67Z0rRS5sDGu0cer5URCggwoT29r7Kmq+xmJmPBEHbMyTJFFPhl1W9TkUqJLQUfzO5D2BQTnXtKAhLidwIWF00o6Bvd1QGt0ITf+POUpirhVI94lv/4A/YM6b+mRF+PgCRF12yS/eANXcI354+IIE11FdjlnEnKmZDy9O6mIHmkPR1PvbgQxa7IHr1XJQfXJYsC5+vbjvvWWce33Ziadgpft6m30xh/rdiXNDM1b3RrbSGT27hdvrRHTVI70N53ryk4CVuQufvax5KbHrtCz5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VA8NBgWZfR3zmZIqQgtIHTjlGfpPy2BbpTPLqPHSgL4=;
 b=T/qb9RMWf2k+QR3Pu6eLCBb5QIEFxab/mIPReRHAUIlWtmJwh33eky3Zi/JQqZ49+avdL6j1DoZ0BlXgWgvYipFJxgiewZNSnUi9hnB8hy/o1gMFbSxuKttjeRlpJrI5DFR0EOOXivC0PmRW2HHS90SvlNiHTXiuOQNIxOq1tZ5niXdOOA7H5URZZepXHvwPzqURE1bZfgV07gBBr413kBxDmYP9dz6x649FrDJf4UvKd4HDqtFzYn9F9TlF3qjCqPl9J11p0CPZHPyLYlR87L7TTlEVvjw1B+kkYhLEWn/snE9E7TxVu7Hxx2g0fm/6A0NTSef4CYwt84scrczXvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0118.namprd12.prod.outlook.com (2603:10b6:0:51::14) by
 DM6PR12MB3516.namprd12.prod.outlook.com (2603:10b6:5:18a::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Tue, 30 Jul 2019 09:34:22 +0000
Received: from DM3NAM03FT017.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by DM3PR12CA0118.outlook.office365.com
 (2603:10b6:0:51::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2115.15 via Frontend
 Transport; Tue, 30 Jul 2019 09:34:22 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT017.mail.protection.outlook.com (10.152.82.201) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Tue, 30 Jul 2019 09:34:22 +0000
Received: from [10.65.99.155] (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Tue, 30 Jul
 2019 04:34:20 -0500
Subject: Re: [PATCH] drm/amdgpu: fix error handling in
 amdgpu_cs_process_fence_dep
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 <amd-gfx@lists.freedesktop.org>
References: <20190730091814.77974-1-christian.koenig@amd.com>
From: zhoucm1 <zhoucm1@amd.com>
Message-ID: <5f843602-349d-39a6-40f2-2320e2c821cd@amd.com>
Date: Tue, 30 Jul 2019 17:34:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190730091814.77974-1-christian.koenig@amd.com>
Content-Language: en-US
X-Originating-IP: [10.34.1.3]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(136003)(39860400002)(2980300002)(428003)(199004)(189003)(2906002)(36756003)(5660300002)(126002)(426003)(476003)(64126003)(229853002)(316002)(16526019)(6666004)(336012)(356004)(486006)(65826007)(76176011)(11346002)(446003)(58126008)(54906003)(110136005)(68736007)(23676004)(31696002)(186003)(305945005)(7736002)(478600001)(2616005)(16576012)(67846002)(70206006)(70586007)(8676002)(65806001)(81166006)(3846002)(6116002)(65956001)(8936002)(81156014)(53936002)(26005)(4326008)(2486003)(47776003)(6246003)(31686004)(50466002)(2870700001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3516; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19a669b6-d580-485d-1200-08d714d11ac7
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR12MB3516; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB3516:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3516CD0DE9417C820B6DE91AB4DC0@DM6PR12MB3516.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:246;
X-Forefront-PRVS: 0114FF88F6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: laZVeEHYA4KRonss+1N4uB2Roh4VDH7LtRWPsVinphMEZh+f4osvUYb/7hZmwyxTSMKlcYBWnRmQqbhSqeV3Ex+urgECxiFqwDux9GT1Bs0tUXiI2JRT0wrMeZDmYCDLzoalsUYhmpep5z8H2O6IYPhT/q9q2+v0z7DI+q4zvAatRsVsWDw+gSfAR19TwTx7lgD3x7pxsL6JkwEhe6hRmQwkR7hENTojOuZeFWH4l5HqXQsQysO534fRSMVk0MtrXIPqBzQCcky9nDATfD5hE4z2EKqlH6VWE+kqolvIOwkQRoVisKKw7cRoPL9OynLXxPeWF8l2CbgrnGtz31drLO00u3/pDX18bcEcaaPSovAnhGTW+mheSx5XOjTNwTs2tr1YJqTl5kquYnSu0Bx1oZpU7rxcbcLmHmKDXuNhBpk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2019 09:34:22.4579 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a669b6-d580-485d-1200-08d714d11ac7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3516
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VA8NBgWZfR3zmZIqQgtIHTjlGfpPy2BbpTPLqPHSgL4=;
 b=tuoQE3NiVJecPpEgkv1/bc6M9ru1avdRYnjcaqBUGwbpXDbc4fqyspndw49hdktpifSZ3iwWSjw3MC6uQZbMLN9M2nH39pvDsrQ121xmxjRMJgQazugy90W6Hmgh6YMDV9zTqHBw388/AaLAoDLHDd+5c26SbTK9Jo+EDU1BQlE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: David1.Zhou@amd.com, teroincn@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TG9va3MgdmVyeSBjbGVhbiwgUmV2aWV3ZWQtYnk6IENodW5taW5nIFpob3UgPGRhdmlkMS56aG91
QGFtZC5jb20+CgoKT24gMjAxOeW5tDA35pyIMzDml6UgMTc6MTgsIENocmlzdGlhbiBLw7ZuaWcg
d3JvdGU6Cj4gV2UgYWx3YXlzIG5lZWQgdG8gZHJvcCB0aGUgY3R4IHJlZmVyZW5jZSBhbmQgc2hv
dWxkIGNoZWNrCj4gZm9yIGVycm9ycyBmaXJzdCBhbmQgdGhlbiBkZXJlZmVyZW5jZSB0aGUgZmVu
Y2UgcG9pbnRlci4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9jcy5jIHwgMjYgKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9jcy5jCj4gaW5kZXggYzY5MWRmNmY3YTU3Li5kZWYwMjlhYjU2NTcg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwo+IEBAIC0xMDQyLDI5
ICsxMDQyLDI3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2NzX3Byb2Nlc3NfZmVuY2VfZGVwKHN0cnVj
dCBhbWRncHVfY3NfcGFyc2VyICpwLAo+ICAgCQkJcmV0dXJuIHI7Cj4gICAJCX0KPiAgIAo+IC0J
CWZlbmNlID0gYW1kZ3B1X2N0eF9nZXRfZmVuY2UoY3R4LCBlbnRpdHksCj4gLQkJCQkJICAgICBk
ZXBzW2ldLmhhbmRsZSk7Cj4gKwkJZmVuY2UgPSBhbWRncHVfY3R4X2dldF9mZW5jZShjdHgsIGVu
dGl0eSwgZGVwc1tpXS5oYW5kbGUpOwo+ICsJCWFtZGdwdV9jdHhfcHV0KGN0eCk7Cj4gKwo+ICsJ
CWlmIChJU19FUlIoZmVuY2UpKQo+ICsJCQlyZXR1cm4gUFRSX0VSUihmZW5jZSk7Cj4gKwkJZWxz
ZSBpZiAoIWZlbmNlKQo+ICsJCQljb250aW51ZTsKPiAgIAo+ICAgCQlpZiAoY2h1bmstPmNodW5r
X2lkID09IEFNREdQVV9DSFVOS19JRF9TQ0hFRFVMRURfREVQRU5ERU5DSUVTKSB7Cj4gLQkJCXN0
cnVjdCBkcm1fc2NoZWRfZmVuY2UgKnNfZmVuY2UgPSB0b19kcm1fc2NoZWRfZmVuY2UoZmVuY2Up
Owo+ICsJCQlzdHJ1Y3QgZHJtX3NjaGVkX2ZlbmNlICpzX2ZlbmNlOwo+ICAgCQkJc3RydWN0IGRt
YV9mZW5jZSAqb2xkID0gZmVuY2U7Cj4gICAKPiArCQkJc19mZW5jZSA9IHRvX2RybV9zY2hlZF9m
ZW5jZShmZW5jZSk7Cj4gICAJCQlmZW5jZSA9IGRtYV9mZW5jZV9nZXQoJnNfZmVuY2UtPnNjaGVk
dWxlZCk7Cj4gICAJCQlkbWFfZmVuY2VfcHV0KG9sZCk7Cj4gICAJCX0KPiAgIAo+IC0JCWlmIChJ
U19FUlIoZmVuY2UpKSB7Cj4gLQkJCXIgPSBQVFJfRVJSKGZlbmNlKTsKPiAtCQkJYW1kZ3B1X2N0
eF9wdXQoY3R4KTsKPiArCQlyID0gYW1kZ3B1X3N5bmNfZmVuY2UocC0+YWRldiwgJnAtPmpvYi0+
c3luYywgZmVuY2UsIHRydWUpOwo+ICsJCWRtYV9mZW5jZV9wdXQoZmVuY2UpOwo+ICsJCWlmIChy
KQo+ICAgCQkJcmV0dXJuIHI7Cj4gLQkJfSBlbHNlIGlmIChmZW5jZSkgewo+IC0JCQlyID0gYW1k
Z3B1X3N5bmNfZmVuY2UocC0+YWRldiwgJnAtPmpvYi0+c3luYywgZmVuY2UsCj4gLQkJCQkJdHJ1
ZSk7Cj4gLQkJCWRtYV9mZW5jZV9wdXQoZmVuY2UpOwo+IC0JCQlhbWRncHVfY3R4X3B1dChjdHgp
Owo+IC0JCQlpZiAocikKPiAtCQkJCXJldHVybiByOwo+IC0JCX0KPiAgIAl9Cj4gICAJcmV0dXJu
IDA7Cj4gICB9CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
