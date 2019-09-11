Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DE5AF4A8
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Sep 2019 05:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2C76E9EA;
	Wed, 11 Sep 2019 03:21:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760087.outbound.protection.outlook.com [40.107.76.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A286E9EB
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Sep 2019 03:21:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHCRRrBchjQcbO6+y1JE7wgpx7YCUMsgG8yDTxngFLS/iroYnfNhEUH9lmccxU4Rgbu5zXXiJUKouPk3ILg8deb8od8Omqaktg2/wKEb3+E7LWh4Gaalv5VFM48sBw2REyc6bRigmJf1iTrgOVP32c3iR1vbdU/7zKlAACShOHdzCfeZ2/oOi4II4B1bM/uOiPB4WGLRHlrDYd4GItv2ZAqA6SIZvsbo0CW9gAX7LaULg1c0+lJc6yVgacQu+RjOrIHrMeYOo58agbCETeLxlcuOaJqOLBDKQKVvhiHB/PreLP4UkWu4SL6G593S5qdpV3Eowg0ROtUXPBR5VtPU4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oAARZw0IEZUGO2jQCV6pD32C/SknStLguk89bRtZve8=;
 b=jw3n77EPdMyOZX6JY70w874GwvPTr7IT5pdU8KHR+sEwi/s0sMQooaqwO5NiW5nq7LCr7DMAzwS9C34Ne7BBG4UXI+8/YGkzohYsm47qgNTy3QK1k1bl93L8W5ywu0fLPMCZjSjso14+up3yLc85hdUZJZiV4p92oIwV8RTNK8hDsQS27gaJ9EsvkD4YNYut15JJY+JTRK2t6PBReeYmFXh2ymX9InjVTRQKoLBSJ/OxSt8vPZ75aTvRac4eUDXhGHkHr6x5bUudVSDaIqwPjWgy1eCyQ325BYUkrbVJsG3LBN4uxPlt1uzDsnAOklZA8a5PQHN035LolSWx0A/asg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB2726.namprd12.prod.outlook.com (20.177.124.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Wed, 11 Sep 2019 03:21:08 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11%7]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 03:21:08 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>, "Li, Dennis" <Dennis.Li@amd.com>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH 1/4] drm/amdgpu: add ras error query count interface for nbio
Thread-Topic: [PATCH 1/4] drm/amdgpu: add ras error query count interface for
 nbio
Thread-Index: AQHVaE/xgOszPoUH6k6PgCRtDF8WRA==
Date: Wed, 11 Sep 2019 03:21:04 +0000
Message-ID: <20190911032016.10313-2-guchun.chen@amd.com>
References: <20190911032016.10313-1-guchun.chen@amd.com>
In-Reply-To: <20190911032016.10313-1-guchun.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR04CA0088.apcprd04.prod.outlook.com
 (2603:1096:202:15::32) To BYAPR12MB2806.namprd12.prod.outlook.com
 (2603:10b6:a03:70::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fee7d359-9b78-4a0e-4546-08d73667145a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2726; 
x-ms-traffictypediagnostic: BYAPR12MB2726:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2726231B35E2AC4B76B6D9C9F1B10@BYAPR12MB2726.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(199004)(189003)(102836004)(99286004)(66476007)(110136005)(316002)(54906003)(6436002)(11346002)(76176011)(26005)(305945005)(7736002)(446003)(6512007)(52116002)(36756003)(66946007)(71190400001)(71200400001)(86362001)(8936002)(5660300002)(81166006)(53936002)(81156014)(50226002)(8676002)(2501003)(1076003)(256004)(6116002)(14454004)(6506007)(6486002)(3846002)(2616005)(66556008)(6666004)(386003)(486006)(25786009)(476003)(186003)(4326008)(66066001)(478600001)(66446008)(64756008)(6636002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2726;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 840PlVVOE0i2O+jsPQwRoE5q7uB8uoHUSX8qEoKHxbDWIPXXX3UKZA/LPjGOWbCaFS+cQrXHs9AU52G/94IeqgsSTEhFv3uotW+Fgc7wpFMtyNwaUnwRhGt0iFEaaGdM2vBflk3+TE7Bg4kVj+6H9RyWhuQZelRibIMj5L1DFoYoxLFi0fXDEcJlO38XcSZEVc+gKpZxc6LuETAZPi62Vl5UlYKl9+cnOUGmPUh5wGEov59Qjr/1XIb/h4oZKWciMUSIMuJxPuWty11EoLkgdNaQuAqbyHdW2SLMGBX6A82uIi+UjMatDyvJVQLXPQHHxEQHucso/RAVAdAZnv6KzdYnAcIHSHUkNfOV4eYN8IaiX3hb2s446zQXmAJs2RnUFZgRfFNhRO+1xYVpV8qGWC9ILhABDYO05SRO6/iyePY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fee7d359-9b78-4a0e-4546-08d73667145a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 03:21:04.8985 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: klH/B6zZbC31df2erIBXdgXTFyNVyv0B1EY6mqhp/nh2HMGkvvgwTgkDmJlT0ebQ8H5nDeckrj3k6MbafTq/0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2726
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oAARZw0IEZUGO2jQCV6pD32C/SknStLguk89bRtZve8=;
 b=Qz2dmhJu/jrXtx5bHNBB737WUZnjomoooVEwbyr177AX31RPQh+Hq8BKP/3EYyUX2c6v7BKcnSzP56vRXn0V+OjfPhW7bdxIfk9BYzZSXuuyzZaNOqCUBEIUn6xb7JO6PIL7uEWPCmTZK4O480vQm6Q9jm17c1hvyCBZRofO5Rc=
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Li, Candice" <Candice.Li@amd.com>, "Chen,
 Guchun" <Guchun.Chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIHRoZSBpbnRlcmZhY2UgcXVlcnlfcmFzX2Vycm9yX2NvdW50IGZvciBuYmlvLgoKQ2hhbmdl
LUlkOiBJMzJhOWQ4MTAyMDY4YmQ4ZWI1Mzk2MWQyOTBlYWMxZDFhNzEzN2E5OQpTaWduZWQtb2Zm
LWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEd1Y2h1biBD
aGVuIDxndWNodW4uY2hlbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9uYmlvLmggfCAyICsrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlvX3Y3
XzQuYyAgIHwgNiArKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X25iaW8uaCBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9uYmlvLmgKaW5kZXggYzUyNTVhN2ZkNjVhLi45
ZTI2YjgxYmE2YWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9uYmlvLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X25iaW8uaApA
QCAtODEsNiArODEsOCBAQCBzdHJ1Y3QgYW1kZ3B1X25iaW9fZnVuY3MgewogCXZvaWQgKCpoYW5k
bGVfcmFzX2Vycl9ldmVudF9hdGh1Yl9pbnRyX25vX2JpZnJpbmcpKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KTsKIAlpbnQgKCppbml0X3Jhc19jb250cm9sbGVyX2ludGVycnVwdCkoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogCWludCAoKmluaXRfcmFzX2Vycl9ldmVudF9hdGh1Yl9p
bnRlcnJ1cHQpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKKwl2b2lkICgqcXVlcnlfcmFz
X2Vycm9yX2NvdW50KShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKKwkJCQkJdm9pZCAqcmFz
X2Vycm9yX3N0YXR1cyk7CiAJaW50ICgqcmFzX2xhdGVfaW5pdCkoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpOwogfTsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
bmJpb192N180LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlvX3Y3XzQuYwppbmRl
eCAyZDE3MWJmMDdhZDUuLmZhNmE4OTE4ZGM4YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvbmJpb192N180LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
bmJpb192N180LmMKQEAgLTQ3Myw2ICs0NzMsMTEgQEAgc3RhdGljIGludCBuYmlvX3Y3XzRfaW5p
dF9yYXNfZXJyX2V2ZW50X2F0aHViX2ludGVycnVwdCAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmEK
IAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIHZvaWQgbmJpb192N180X3F1ZXJ5X3Jhc19lcnJvcl9j
b3VudChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKKwkJCQkJdm9pZCAqcmFzX2Vycm9yX3N0
YXR1cykKK3sKK30KKwogY29uc3Qgc3RydWN0IGFtZGdwdV9uYmlvX2Z1bmNzIG5iaW9fdjdfNF9m
dW5jcyA9IHsKIAkuZ2V0X2hkcF9mbHVzaF9yZXFfb2Zmc2V0ID0gbmJpb192N180X2dldF9oZHBf
Zmx1c2hfcmVxX29mZnNldCwKIAkuZ2V0X2hkcF9mbHVzaF9kb25lX29mZnNldCA9IG5iaW9fdjdf
NF9nZXRfaGRwX2ZsdXNoX2RvbmVfb2Zmc2V0LApAQCAtNDk4LDUgKzUwMyw2IEBAIGNvbnN0IHN0
cnVjdCBhbWRncHVfbmJpb19mdW5jcyBuYmlvX3Y3XzRfZnVuY3MgPSB7CiAJLmhhbmRsZV9yYXNf
ZXJyX2V2ZW50X2F0aHViX2ludHJfbm9fYmlmcmluZyA9IG5iaW9fdjdfNF9oYW5kbGVfcmFzX2Vy
cl9ldmVudF9hdGh1Yl9pbnRyX25vX2JpZnJpbmcsCiAJLmluaXRfcmFzX2NvbnRyb2xsZXJfaW50
ZXJydXB0ID0gbmJpb192N180X2luaXRfcmFzX2NvbnRyb2xsZXJfaW50ZXJydXB0LAogCS5pbml0
X3Jhc19lcnJfZXZlbnRfYXRodWJfaW50ZXJydXB0ID0gbmJpb192N180X2luaXRfcmFzX2Vycl9l
dmVudF9hdGh1Yl9pbnRlcnJ1cHQsCisJLnF1ZXJ5X3Jhc19lcnJvcl9jb3VudCA9IG5iaW9fdjdf
NF9xdWVyeV9yYXNfZXJyb3JfY291bnQsCiAJLnJhc19sYXRlX2luaXQgPSBhbWRncHVfbmJpb19y
YXNfbGF0ZV9pbml0LAogfTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
