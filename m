Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7670EB73D7
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 09:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAFE6F96B;
	Thu, 19 Sep 2019 07:13:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680046.outbound.protection.outlook.com [40.107.68.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF7286F963
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 07:13:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JEWLcfkHnAxHUzg5ElDMRwfyCNpLew4lo42hzagFWaTszpyRnOYjEzCxWHmyf3BrIRXHlwU8KAgFmL38T9FNcUPjwnfmGkSmDa/MyHiMKjuAXvBvz1KtpiUqKG7Wi0GMnPnfTevGwUnPz5jhkuaXnto98yW0KESH5b6ohJe9rUy6g0gIyfen3VXiHeO84mg86WxihKOTi61Zr+SYRvWX9AWYbkEbCKB0K1Rmx97ujWaxWKyfnVzohwSEVWORnCZEoDshbumBkvh0jnJ3JnPWisG/Ckj+/gsz51SJzlAFSivLPSEhcsrA5rFhOIYciIaVLHgOl3ExssNdEz1B3hnLxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3sl5OkJKNlF9c+AROCWEXGI8UQjJUczM8gKfH9P+Zjw=;
 b=Y1Hg2nwcSlzQYlxQmygGLanlW/bEdzpbTNy/fLcI94fj0UakjSXLa4ScMO49QVjq0Zwhap1aW5LNm2LtabLcsZSQBpS7B82CsSipGg7zj0wmlvSfu28I6A80nh+3fUogujMdH6y0ynQabahZV1FYx2dB4b9l3KYTL63L+RFBLGcLJoKb3p2SG6pSZMuwUc2InYi7M0xt9Cp2f80aTtQoL8spr4U91aTB5pxLWsCs6bteRZVPy3Ts2AfMtGdWxOe4Tf858uNaXKCmuTvhH6lOkP3gXceBF6mcwl08rwTlPj2TfvEeHG6zLD9wW2DkApC6pPMTpVV2P/WsrtcmWOJNKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3440.namprd12.prod.outlook.com (20.178.244.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Thu, 19 Sep 2019 07:13:15 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 07:13:15 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH 20/21] drm/amdgpu: move xgmi ras fini to xgmi block
Thread-Topic: [PATCH 20/21] drm/amdgpu: move xgmi ras fini to xgmi block
Thread-Index: AQHVbrm0s6U9MI6mI0q1lGRvIZwXlg==
Date: Thu, 19 Sep 2019 07:13:14 +0000
Message-ID: <20190919071115.16552-21-tao.zhou1@amd.com>
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
x-ms-office365-filtering-correlation-id: 07382cf1-8d3e-4be3-679d-08d73cd0d688
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3440; 
x-ms-traffictypediagnostic: MN2PR12MB3440:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB344083C7853099C0B29F4BE6B0890@MN2PR12MB3440.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(199004)(189003)(25786009)(66066001)(14454004)(256004)(478600001)(6512007)(4326008)(2906002)(66946007)(66446008)(64756008)(316002)(66556008)(66476007)(6436002)(6116002)(110136005)(3846002)(6486002)(99286004)(6636002)(76176011)(2501003)(52116002)(1076003)(36756003)(5660300002)(446003)(2616005)(11346002)(476003)(305945005)(7736002)(26005)(102836004)(486006)(386003)(6506007)(186003)(8676002)(71190400001)(86362001)(71200400001)(8936002)(81156014)(50226002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3440;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mA8NIdJp+bHuYVmhSdcoCjFChFWhnF2V6oDUpXFDRhR6rIdY+U1oAB4rsDM+Sum9UzWHy9ZAv4cfiyuo3PvdOT2DrO76Q0vYwtqbhRvsy8WJNkPJEX/7lxXoXLhdUeFwb68aOR4rL2EE+WEqEVcEABqICKCMjaImbhkX4mmHY8oUIc906/8Y/7pFt8aNIa2ufITRbNvTE+X8vqz0cVZyoYZnMosj0AK393zLDAsu12IFr2MN3eJG6lbqAyIq2sbVL+el1K6zy7XiObsTCOu0Pj9Cf+jIltyD7KDiiveN1rxiqsJW3vj3w17/GPSXlsS7wuqapTUkHm7wQxk72M1z/y3EHHa5VlJxZiJ+vux/ICQsTcHb2GdHOX5aeEN/EmG2Ax4U+Pu0D0w1iRu/Qm5GyptSK/9rEU6nu84BrlmtYOA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07382cf1-8d3e-4be3-679d-08d73cd0d688
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 07:13:14.8890 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 89bY6MdZWPEL00h5ZsT5jL4xthlCOH5pHsQ3ZK6DH8NhLZfoSBXnlx2wEb75UK8+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3440
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3sl5OkJKNlF9c+AROCWEXGI8UQjJUczM8gKfH9P+Zjw=;
 b=OTBFBe/oPJ5oi/GWFGDPCmgL+PBaJvnSpoLObmwKim3cT5txoMPhzYMQkmNGI5Ly5+Y+6X0Uot2Iy3xjVpKzqt5PdeClh2e+d1H8StyrHrwbb4krUtNuaMJhQjuTtWrtMTppRlVZnqTUG+/LjHyghYDfpWw1ijAlaEWtYeA1HZw=
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

aXQncyBtb3JlIHN1aXRhYmxlIHRvIHB1dCB4Z21pIHJhcyBmaW5pIGluIHhnbWkgYmxvY2sKClNp
Z25lZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmMgIHwgMTMgKystLS0tLS0tLS0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuYyB8IDE0ICsrKysrKysrKysrKysrCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfeGdtaS5oIHwgIDEgKwogMyBmaWxlcyBj
aGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZ21jLmMKaW5kZXggZDM1NjY5ZTBkYmFjLi44ZGM1MjUxZDM0NmYg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmMKQEAgLTI2LDYgKzI2LDcg
QEAKIAogI2luY2x1ZGUgImFtZGdwdS5oIgogI2luY2x1ZGUgImFtZGdwdV9yYXMuaCIKKyNpbmNs
dWRlICJhbWRncHVfeGdtaS5oIgogCiAvKioKICAqIGFtZGdwdV9nbWNfZ2V0X3BkZV9mb3JfYm8g
LSBnZXQgdGhlIFBERSBmb3IgYSBCTwpAQCAtMzA5LDE1ICszMTAsNSBAQCB2b2lkIGFtZGdwdV9n
bWNfcmFzX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7CiAJYW1kZ3B1X3VtY19y
YXNfZmluaShhZGV2KTsKIAlhbWRncHVfbW1odWJfcmFzX2ZpbmkoYWRldik7Ci0KLQlpZiAoYW1k
Z3B1X3Jhc19pc19zdXBwb3J0ZWQoYWRldiwgQU1ER1BVX1JBU19CTE9DS19fWEdNSV9XQUZMKSAm
JgotCQkJYWRldi0+Z21jLnhnbWkucmFzX2lmKSB7Ci0JCXN0cnVjdCByYXNfY29tbW9uX2lmICpy
YXNfaWYgPSBhZGV2LT5nbWMueGdtaS5yYXNfaWY7Ci0JCXN0cnVjdCByYXNfaWhfaWYgaWhfaW5m
byA9IHsKLQkJCS5jYiA9IE5VTEwsCi0JCX07Ci0KLQkJYW1kZ3B1X3Jhc19sYXRlX2ZpbmkoYWRl
diwgcmFzX2lmLCAmaWhfaW5mbyk7Ci0JCWtmcmVlKHJhc19pZik7Ci0JfQorCWFtZGdwdV94Z21p
X3Jhc19maW5pKGFkZXYpOwogfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3hnbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94Z21p
LmMKaW5kZXggN2Y2ZjJlOTY0YWUzLi4wMDM3MTcxM2M2NzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94Z21pLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3hnbWkuYwpAQCAtNDczLDMgKzQ3MywxNyBAQCBpbnQgYW1kZ3B1X3hn
bWlfcmFzX2xhdGVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAogCXJldHVybiBy
OwogfQorCit2b2lkIGFtZGdwdV94Z21pX3Jhc19maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQoreworCWlmIChhbWRncHVfcmFzX2lzX3N1cHBvcnRlZChhZGV2LCBBTURHUFVfUkFTX0JM
T0NLX19YR01JX1dBRkwpICYmCisJCQlhZGV2LT5nbWMueGdtaS5yYXNfaWYpIHsKKwkJc3RydWN0
IHJhc19jb21tb25faWYgKnJhc19pZiA9IGFkZXYtPmdtYy54Z21pLnJhc19pZjsKKwkJc3RydWN0
IHJhc19paF9pZiBpaF9pbmZvID0geworCQkJLmNiID0gTlVMTCwKKwkJfTsKKworCQlhbWRncHVf
cmFzX2xhdGVfZmluaShhZGV2LCByYXNfaWYsICZpaF9pbmZvKTsKKwkJa2ZyZWUocmFzX2lmKTsK
Kwl9Cit9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfeGdt
aS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuaAppbmRleCA5MDIz
Nzg5Mzk3YzAuLmJiZjUwNGZmNzA1MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3hnbWkuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfeGdtaS5oCkBAIC00Myw2ICs0Myw3IEBAIGludCBhbWRncHVfeGdtaV9zZXRfcHN0YXRlKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBpbnQgcHN0YXRlKTsKIGludCBhbWRncHVfeGdtaV9n
ZXRfaG9wc19jb3VudChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJc3RydWN0IGFtZGdw
dV9kZXZpY2UgKnBlZXJfYWRldik7CiBpbnQgYW1kZ3B1X3hnbWlfcmFzX2xhdGVfaW5pdChzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7Cit2b2lkIGFtZGdwdV94Z21pX3Jhc19maW5pKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KTsKIAogc3RhdGljIGlubGluZSBib29sIGFtZGdwdV94Z21p
X3NhbWVfaGl2ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmJvX2FkZXYpCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
