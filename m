Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1C1B73D2
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 09:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8256F958;
	Thu, 19 Sep 2019 07:13:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on0606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::606])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FD46F958
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 07:13:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aAR6phuzzPnKcO0aiahLr1ZA4RknNWaULD6XUIG01J0Q0U69Ory/3YzL1w+gxKEXdDvDdSy6pzj5OknjVBaMCtfotQvPLAT/o30f0+Pq/6Ho4QXOB6+izdh7CMh7RdVGva6WEYr6k4sQS/MYBwLZR1ulm9Lm5qJ5hutiO6+rG7/4TJSJzmppEC9+9zWx5Mn8izRnrs/d3iqoQFex0zBEVbUe0qeddJqdWbV4VL0sf9jPaW1dv2YeZaGQKR7kc4hNpiQeOC8yWbSRNT2K1AiB3gdzFslrS9qtACurttWpcgcVdMKpwZKEZhfjP+t93Q0ijDAl8yJQml215sGQ6UHnWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1+MvTLoH77ZhzFThPmjqZA7biz93l6lG5EgwBOUUC4=;
 b=juCvfKXOoTe2HF+RWmOWL3O5Ws5KHm88qNL8gVqgnMOen1P2/RpWH7EJKioM1IxMQqJw7yAx7LttrOQtKI/hOZgoxzTQotjVOeHknnhqbvmFTqjdHENNsUeA+P7LeOtayDoXAiDufrsMnDacgdPgPiYJDtO9OnGeCQbBm7ba4VgPVTC2PBtBjrD+gOsyvNUX+2wgAedMJIZOOFcnCdw5XdKP3zKEpKosKN0Yd3a2hxRTnmW9shcwp0eAr04AnMPzi2PqmUWnchbo/eA+BcEXmktrW7BqbqGsxYqJATeCib8dOwhcrNlZ9GKdRfSMmf6qygNsqfpnEn/2WWYr4vvA7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB2894.namprd12.prod.outlook.com (20.179.84.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 19 Sep 2019 07:13:05 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 07:13:05 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH 16/21] drm/amdgpu: add ras fini for nbio
Thread-Topic: [PATCH 16/21] drm/amdgpu: add ras fini for nbio
Thread-Index: AQHVbrmuZybKst/J0EuOwM9nYdKEeA==
Date: Thu, 19 Sep 2019 07:13:05 +0000
Message-ID: <20190919071115.16552-17-tao.zhou1@amd.com>
References: <20190919071115.16552-1-tao.zhou1@amd.com>
In-Reply-To: <20190919071115.16552-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0092.apcprd03.prod.outlook.com
 (2603:1096:203:72::32) To MN2PR12MB3054.namprd12.prod.outlook.com
 (2603:10b6:208:d1::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ddcfed0-e0e9-4bb0-bf37-08d73cd0d0dc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB2894; 
x-ms-traffictypediagnostic: MN2PR12MB2894:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2894728B2ADF8EFD7C751491B0890@MN2PR12MB2894.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:431;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(199004)(189003)(186003)(6506007)(102836004)(6512007)(316002)(8676002)(81156014)(64756008)(446003)(2501003)(52116002)(11346002)(476003)(2616005)(66446008)(86362001)(8936002)(5660300002)(66946007)(66476007)(81166006)(66556008)(50226002)(3846002)(2906002)(486006)(76176011)(99286004)(110136005)(6116002)(25786009)(7736002)(256004)(1076003)(66066001)(26005)(14454004)(386003)(6436002)(6486002)(14444005)(4326008)(478600001)(71190400001)(71200400001)(6636002)(305945005)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2894;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PWDPOVa4PsKWl5C7rQoIb0x2cvOPR0OQOdcj/vl2LyK+yEkgMm4zREk9iX2nAy4/b3sCyfgCGJhF3oRv80OtgDzlePC/yagvvrAewMhEZ47T8Aoh1WJYmSQTITF+I7U+TeUyWRh9j5MQ4tubq4a13VN8xt35216zX2SFBHPmbPtAo0Isigiu+rUxcbpZa48NWIBL9+/OBVG42GxDKUHGCDaJonS++3zsEEpcf9FEui/s4E9nWM7S3fgrsnNe6V3ZIPOrrlBMg3CLhGEqI6nm/gQKXHkqxG48ASkBl40ocU66TvAOyB2qNZ6joqOombzh2UoyXPCLjSVDfw3y+wtqoomyrS+pByGlFoUMrECJfbfXNKhDNsAg9QKQD5B5PQhDA2y3w/sFZK+wKvnXUeCTeANtZjPxxlTE53HMf7wSzZg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ddcfed0-e0e9-4bb0-bf37-08d73cd0d0dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 07:13:05.3615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J19DFBPfreW96Pr/H8OcMvYZSWyp8e1UehGe8xHXyDCKYnModSK7gb9NuKyWdWfr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2894
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1+MvTLoH77ZhzFThPmjqZA7biz93l6lG5EgwBOUUC4=;
 b=zp4XWhhPYgyhcJNsGZQBYY84MdmcSEUQcHm5woaFXWzs8JdKKURq/IECa8YT9zQCwXhTzil0qxI3Fq/6egSfL/ITMeBVvqbK0ao/1RYk2ITpeutSddbiEsEOKfxAvge5Me8lmFN3pKXlL934F0WXozodHLgNpt2CNvlIb/hseAw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YWRkIGEgY29tbW9uIG5iaW8gcmFzIGZpbmkgaW1wbGVtZW50YXRpb24gdG8gY2xlYW51cCBuYmlv
IHJhcyBmcmFtZXdvcmsKClNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbmJpby5jIHwgMTQgKysr
KysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9uYmlvLmggfCAg
MiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyAgICAgICB8ICAxICsKIDMg
ZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9uYmlvLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbmJpby5jCmluZGV4IDY1MzczYWQwMzc2My4uN2Q1YzNh
OWRlOWVhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbmJp
by5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9uYmlvLmMKQEAgLTY4
LDMgKzY4LDE3IEBAIGludCBhbWRncHVfbmJpb19yYXNfbGF0ZV9pbml0KHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQogCWFkZXYtPm5iaW8ucmFzX2lmID0gTlVMTDsKIAlyZXR1cm4gcjsKIH0K
Kwordm9pZCBhbWRncHVfbmJpb19yYXNfZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikK
K3sKKwlpZiAoYW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQoYWRldiwgQU1ER1BVX1JBU19CTE9DS19f
UENJRV9CSUYpICYmCisJCQlhZGV2LT5uYmlvLnJhc19pZikgeworCQlzdHJ1Y3QgcmFzX2NvbW1v
bl9pZiAqcmFzX2lmID0gYWRldi0+bmJpby5yYXNfaWY7CisJCXN0cnVjdCByYXNfaWhfaWYgaWhf
aW5mbyA9IHsKKwkJCS5jYiA9IE5VTEwsCisJCX07CisKKwkJYW1kZ3B1X3Jhc19sYXRlX2Zpbmko
YWRldiwgcmFzX2lmLCAmaWhfaW5mbyk7CisJCWtmcmVlKHJhc19pZik7CisJfQorfQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X25iaW8uaCBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9uYmlvLmgKaW5kZXggOWUyNmI4MWJhNmFkLi4xZjI2
YTE3ZTY1NjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9u
YmlvLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X25iaW8uaApAQCAt
OTUsNSArOTUsNSBAQCBzdHJ1Y3QgYW1kZ3B1X25iaW8gewogfTsKIAogaW50IGFtZGdwdV9uYmlv
X3Jhc19sYXRlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwotCit2b2lkIGFtZGdw
dV9uYmlvX3Jhc19maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKICNlbmRpZgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKaW5kZXggNzY5YzU2OGQzNTUyLi5lNjQyMzlkNWY4OWEg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwpAQCAtMTI0Myw2ICsxMjQzLDcgQEAgc3Rh
dGljIGludCBzb2MxNV9jb21tb25fc3dfZmluaSh2b2lkICpoYW5kbGUpCiB7CiAJc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7CiAKKwlh
bWRncHVfbmJpb19yYXNfZmluaShhZGV2KTsKIAlhZGV2LT5kZl9mdW5jcy0+c3dfZmluaShhZGV2
KTsKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
