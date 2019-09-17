Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1716B47AC
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 08:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46EB96E106;
	Tue, 17 Sep 2019 06:50:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800059.outbound.protection.outlook.com [40.107.80.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40BB6E106
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 06:50:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSgCA11l2ptvyVY8fNyuUMDWwRCUSxuKFPSiLzU6luHUPSbquXL13DoZV9RDML/1BeT76jZCaEygnguTdCnQKo5hvl5e+vBChVO7forPb4XKRhF/CeBj4tVVNgyFM1YLzfhy/RE7l3VKs45NOhzxVRvvQ/o4yI68uWMdNOxstPLNyGCYFuNY2ND+QprLF+Fo9JGdHgqtvTM9fLzSyOWyskdUyZfVOUMypFhMHmpA0b+8KU2V8Vz/qB/JT7arvdW4UphbNT7yqQgc6zwdw9hjTpVpFbz5Ptpoq2jYZb4tctvqFoCwy1aE/wecvah6KJG9zSKFuWz6M16LWWBl904xkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqguImBTEhBkcVtmEA5sHxYEf08sDnFiRSqu4fe5g4M=;
 b=CXRVl0vy3BXeNF47YoR9E2FJR+0Iuf/Wzy+v/eoRN+XJqlRKX6ynvSIS+3oqX8vZRyGTAbmadkB8VXIwBBCh92V1egoKm9TvzzftsX2mKGZdTRGfawZqhTY8H9wJGV5DhgaZ3gWoiStX36/PusdxXpSSj3g6RORhkIVTctjUXEZ6p+5l5MTuVfWyJfcHI2SMVQAFDKv58c+NvE+WBTbWKVV/3eNpotuR5xnqS3zInGIicG0TpU6a3ekGrloq38v+UrQiWnBt13rq/KeHzfPt1uKPoNNbw4mI1QBY30BIDuGwPwsWdb7boS5hf3SyydMGriOe+sIfed2m0ClYg0EKhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB3527.namprd12.prod.outlook.com (20.179.94.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.23; Tue, 17 Sep 2019 06:50:31 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11%7]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 06:50:31 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: RE: [PATCH 2/2] drm/amdgpu: fix size calc error in bo_create_kernel_at
Thread-Topic: [PATCH 2/2] drm/amdgpu: fix size calc error in
 bo_create_kernel_at
Thread-Index: AQHVbR+FdKnPIQ3Sq0KD2srXSJIFZKcvbfCA
Date: Tue, 17 Sep 2019 06:50:29 +0000
Message-ID: <BYAPR12MB28064B780C374BF4F2B14E69F18F0@BYAPR12MB2806.namprd12.prod.outlook.com>
References: <20190917061643.29367-1-tao.zhou1@amd.com>
 <20190917061643.29367-2-tao.zhou1@amd.com>
In-Reply-To: <20190917061643.29367-2-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b80f9ad3-4183-425e-c6de-08d73b3b5556
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BYAPR12MB3527; 
x-ms-traffictypediagnostic: BYAPR12MB3527:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3527C65AADE341750E49ABE9F18F0@BYAPR12MB3527.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1417;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(13464003)(199004)(189003)(6636002)(7736002)(74316002)(2501003)(4744005)(71190400001)(71200400001)(256004)(229853002)(81166006)(486006)(6436002)(33656002)(25786009)(14454004)(478600001)(8936002)(316002)(86362001)(110136005)(305945005)(9686003)(8676002)(14444005)(81156014)(66066001)(446003)(99286004)(66946007)(66556008)(66446008)(64756008)(66476007)(76116006)(52536014)(6116002)(3846002)(76176011)(7696005)(186003)(6246003)(102836004)(53546011)(11346002)(476003)(6506007)(5660300002)(26005)(55016002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3527;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7g5I7bHKPUUX3Vh4ecls8l1K/QVz8Nl13imHvktBm0I/4imXreAra9ITA/1staRNTR1ZHOprcvQgYh9OPmOccpqm7fsd3cOeWflRXPfjQi4x29jGso+A/XgnsklwMwSyz4LpnKleIVxvfr7bNYsRlS0Q4D5O1OziemSP0Io5pLkHAfiaIv8OuHP2VgyUL1OknF886dyEQ/AetL7AvPKe1YUMGUYMrYqNcomstu44awTuEX89TOXMpgLfG/enFNU/3fZBCXfuxlAn/HsJuAD8J0IGjNjz0Poqd2bdjHdmFa1lHZZUCF9skUAsa3WGzHTA+/EREukkyv1wYAHwJw52AUzaOjg5HjPlLZ4Vo1OpoS4J9JnpY3ZUdqqYgaaljpXNReLFPAYPpgPtehnosD8X5adH7wCFlRDUZ2IWkoP6UQI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b80f9ad3-4183-425e-c6de-08d73b3b5556
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 06:50:31.4145 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s7B8M4SOs67f7agLV4Dak2aim9QC4zwdNYE3zJWj17lYNXf5C/MeFhybTW8yrDPcW24uW4BvvNoh4nW1E1yaMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3527
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqguImBTEhBkcVtmEA5sHxYEf08sDnFiRSqu4fe5g4M=;
 b=WoNXYkV49b7o0fBp98psQZ8TFDpGDjFpqdaspzXHC5Oz2BX2a/vzLkixQuaGjOtF7dgwCyPn+fJMJhBhJVDmmTdu8C2zFFkq/JMJn6jXG1Oxpq2802rc4Pys320eqq6E3SzftXB7ya0m9nRBxj5y1iqbo0gur2WTgu0EfIawZ0M=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2VyaWVzIGlzOgpSZXZpZXdlZC1ieTogR3VjaHVuIENoZW4gPGd1Y2h1bi5jaGVuQGFtZC5jb20+
CgpSZWdhcmRzLApHdWNodW4KCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCkZyb206IFpob3Ux
LCBUYW8gPFRhby5aaG91MUBhbWQuY29tPiAKU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDE3LCAy
MDE5IDI6MTcgUE0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBDaGVuLCBHdWNo
dW4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+OyBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktv
ZW5pZ0BhbWQuY29tPjsgWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KQ2M6
IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPgpTdWJqZWN0OiBbUEFUQ0ggMi8yXSBkcm0v
YW1kZ3B1OiBmaXggc2l6ZSBjYWxjIGVycm9yIGluIGJvX2NyZWF0ZV9rZXJuZWxfYXQKCnJlcGxh
Y2Ugb2Zmc2V0IHdpdGggc2l6ZQoKU2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91MUBh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYwppbmRleCBlY2FkODRlMWI0
ZTIuLjJmY2QyZDE0Y2JmMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X29iamVjdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9v
YmplY3QuYwpAQCAtMzY2LDcgKzM2Niw3IEBAIGludCBhbWRncHVfYm9fY3JlYXRlX2tlcm5lbF9h
dChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAlpbnQgcjsKIAogCW9mZnNldCAmPSBQQUdF
X01BU0s7Ci0Jc2l6ZSA9IEFMSUdOKG9mZnNldCwgUEFHRV9TSVpFKTsKKwlzaXplID0gQUxJR04o
c2l6ZSwgUEFHRV9TSVpFKTsKIAogCXIgPSBhbWRncHVfYm9fY3JlYXRlX3Jlc2VydmVkKGFkZXYs
IHNpemUsIFBBR0VfU0laRSwgZG9tYWluLCBib19wdHIsCiAJCQkJICAgICAgTlVMTCwgTlVMTCk7
Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
