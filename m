Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C09B73C2
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 09:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F409E6F89E;
	Thu, 19 Sep 2019 07:12:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700056.outbound.protection.outlook.com [40.107.70.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14306F89E
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 07:12:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7eMV103D2zRFRvobllZg8KIKO3YfWpWkWw/WyT8dnPvIx/atlQe3sPXgoPz6hxXAJ3WhOezq1OPYAdsACu9sgDtN4ZOA9W7evqR9jxyZtztgOE3FFd639I1CgHNxKTSaLFitQT09T/K11jzOZXIUH+0gc1IvNFy4pXtcavAOcn4DF1s/MG+K0nU0om01vSHs9/izyeMkcJKEg4To9CJpXAMq+S89eCehEJv/bawDChrENwNlory9EUoOPvE5hzEG0BYB8SxwYauQEOqxrTcsNdWnBTop9eCiS1a7vk4I2Rcu2gOYXAY7Bxx/9L+r/FxL43U8+wjHRmHkgHWXVaEUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIiYuLsGx/tPjPHGBoWO6vp438IJ/BtWw3B5hC7LhyY=;
 b=DqP47FORr466U4OFshGvWnxSygxnr40xBK0pVmaS5tiOUU3sJ6SMQu87DTWfluUT3oLjipiaI6Jfo/kQODPawnxNlwXDGj6jkUAtT4Tr7VFAB157uyhMuY3UUqkfAZzkpGGwPkwLI/ncNOvDr53lK3iQt/I3uvHQ+V+ddKrLPbU9TSM2BOJz0citaTTxbwq54KTe8lBGoNvpHuHW3rBeF5gP7mcRNekCYo6FTnrZz3TE+Il1T62ssBas2umqEJOMg+729MFakKG/VFAcDqaBXq1uPKDxNJ/YQ4lSanVjV5fGXMGrx5VhzDACR/F0QzExsM9vV/TvBIwu1vMc6P3uTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB2894.namprd12.prod.outlook.com (20.179.84.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 19 Sep 2019 07:12:30 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 07:12:30 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH 01/21] drm/amdgpu: update parameter of ras_ih_cb
Thread-Topic: [PATCH 01/21] drm/amdgpu: update parameter of ras_ih_cb
Thread-Index: AQHVbrmZDMziI/L+uUykyq88HMLFrg==
Date: Thu, 19 Sep 2019 07:12:30 +0000
Message-ID: <20190919071115.16552-2-tao.zhou1@amd.com>
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
x-ms-office365-filtering-correlation-id: 2a5e18b0-886b-4f9c-34b3-08d73cd0bbcf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB2894; 
x-ms-traffictypediagnostic: MN2PR12MB2894:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2894F28C96F1488B0C6D3ADFB0890@MN2PR12MB2894.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(199004)(189003)(186003)(6506007)(102836004)(6512007)(316002)(8676002)(81156014)(64756008)(446003)(2501003)(52116002)(11346002)(476003)(2616005)(66446008)(86362001)(8936002)(5660300002)(66946007)(66476007)(81166006)(66556008)(50226002)(3846002)(2906002)(486006)(76176011)(99286004)(110136005)(6116002)(25786009)(7736002)(256004)(1076003)(66066001)(26005)(14454004)(386003)(6436002)(6486002)(4326008)(478600001)(71190400001)(71200400001)(6636002)(305945005)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2894;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YRBT1A4Rs3qCV5wyFYngtQhOocUrPlhkX612bh0xfLp/4fek1ZO+zmcSaJK+D+H15wwQ8vEM4sPqSP5XfjWgZY6OzA7Y/cXEctWLIg6FkAY/KbbF0ex00CWR7CfdGLqW+ESPi+RzMNLxt6eWe9EqPtnF0txpwtPSI261diJgQCoNYVqIRY8BVssgZkJ3LumQRQYnUMWq0RppK7366BjwC24pR3vx427QpoI31UZvzdOsMKuNqezDuzxhRxN1oe8v9JpUBXt28ndPaFNK4fYKaqeJOvheFLHdbCmgoaxrGXR7XdwqkYlnAy2fLZ8qsxdLg4IAxvXJfYNXB8vF4tWdYpb2pXEStV+XSwGblmKmZtX0/l5XN25mzjS4p6Mv9Sv9et5UXRKFqoKaxWjNpo0XcyjzKxLVuv4UB5LhxG1ndUE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5e18b0-886b-4f9c-34b3-08d73cd0bbcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 07:12:30.1455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UBQHjQA5khHsdC1mcz+04HmGXZQyiYF4QKV8cAcHvzBPxmadckP1Fp0Gg3Yt1Pjq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2894
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIiYuLsGx/tPjPHGBoWO6vp438IJ/BtWw3B5hC7LhyY=;
 b=nUQKVhNA0fnMwWjjClfvi2/vAy84JGHikKv3cG067xwCYAAquzLPfWdZkHC447AohVLKDfd60EDM4fLDY3Hw2ZviCjoX8OsGvRi6E3V9ZUVlyvujxzxNZivQq6h7vokppKACNV7WClojyjMPeGGN2XCTzcaBYGv+LNrNPWHSiGw=
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

Y2hhbmdlIHN0cnVjdCByYXNfZXJyX2RhdGEgKmVycl9kYXRhIHRvIHZvaWQgKmVycl9kYXRhLCBh
bGlnbiB3aXRoIHRoZQppbXBsZW1lbnRhdGlvbiBvZiB1bWMgY29kZSBhbmQgdGhlIGNhbGxiYWNr
J3MgZGVjbGFyYXRpb24gaW4gZWFjaCByYXMKYmxvY2sgY291bGQgcGF5IG5vIGF0dGVudGlvbiB0
byB0aGUgc3RydWN0dXJlIHR5cGUKClNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFA
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmggfCAy
ICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jICAgfCA0ICsrLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgICB8IDYgKysrKy0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyAgfCA0ICsrLS0KIDQgZmlsZXMgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9yYXMuaAppbmRleCBhZTM4NmM0NjZjMGUuLmY4MGZkMzQyOGM5OCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaApAQCAtMzYyLDcgKzM2Miw3IEBAIHN0
cnVjdCByYXNfZXJyX2hhbmRsZXJfZGF0YSB7CiB9OwogCiB0eXBlZGVmIGludCAoKnJhc19paF9j
Yikoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCi0JCXN0cnVjdCByYXNfZXJyX2RhdGEgKmVy
cl9kYXRhLAorCQl2b2lkICplcnJfZGF0YSwKIAkJc3RydWN0IGFtZGdwdV9pdl9lbnRyeSAqZW50
cnkpOwogCiBzdHJ1Y3QgcmFzX2loX2RhdGEgewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
OV8wLmMKaW5kZXggOWExZjkxY2YwZWU4Li42ZDg0NWIzYmM3NjAgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3Y5XzAuYwpAQCAtNDM4Niw3ICs0Mzg2LDcgQEAgc3RhdGljIGludCBnZnhf
djlfMF9lYXJseV9pbml0KHZvaWQgKmhhbmRsZSkKIH0KIAogc3RhdGljIGludCBnZnhfdjlfMF9w
cm9jZXNzX3Jhc19kYXRhX2NiKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAotCQlzdHJ1Y3Qg
cmFzX2Vycl9kYXRhICplcnJfZGF0YSwKKwkJdm9pZCAqZXJyX2RhdGEsCiAJCXN0cnVjdCBhbWRn
cHVfaXZfZW50cnkgKmVudHJ5KTsKIAogc3RhdGljIGludCBnZnhfdjlfMF9lY2NfbGF0ZV9pbml0
KHZvaWQgKmhhbmRsZSkKQEAgLTU2MzksNyArNTYzOSw3IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBf
cHJpdl9pbnN0X2lycShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIH0KIAogc3RhdGljIGlu
dCBnZnhfdjlfMF9wcm9jZXNzX3Jhc19kYXRhX2NiKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LAotCQlzdHJ1Y3QgcmFzX2Vycl9kYXRhICplcnJfZGF0YSwKKwkJdm9pZCAqZXJyX2RhdGEsCiAJ
CXN0cnVjdCBhbWRncHVfaXZfZW50cnkgKmVudHJ5KQogewogCS8qIFRPRE8gdWUgd2lsbCB0cmln
Z2VyIGFuIGludGVycnVwdC4gKi8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dtY192OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCmlu
ZGV4IDU3ZDc2ZWUwZDlkYi4uMzA3M2U4ODZiYmNlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dtY192OV8wLmMKQEAgLTI0MSwxNiArMjQxLDE4IEBAIHN0YXRpYyBpbnQgZ21jX3Y5XzBfZWNj
X2ludGVycnVwdF9zdGF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIH0KIAogc3RhdGlj
IGludCBnbWNfdjlfMF9wcm9jZXNzX3Jhc19kYXRhX2NiKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LAotCQlzdHJ1Y3QgcmFzX2Vycl9kYXRhICplcnJfZGF0YSwKKwkJdm9pZCAqcmFzX2Vycm9y
X3N0YXR1cywKIAkJc3RydWN0IGFtZGdwdV9pdl9lbnRyeSAqZW50cnkpCiB7CisJc3RydWN0IHJh
c19lcnJfZGF0YSAqZXJyX2RhdGEgPSAoc3RydWN0IHJhc19lcnJfZGF0YSAqKXJhc19lcnJvcl9z
dGF0dXM7CisKIAlpZiAoYW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQoYWRldiwgQU1ER1BVX1JBU19C
TE9DS19fR0ZYKSkKIAkJcmV0dXJuIEFNREdQVV9SQVNfU1VDQ0VTUzsKIAogCWtnZDJrZmRfc2V0
X3NyYW1fZWNjX2ZsYWcoYWRldi0+a2ZkLmRldik7CiAJaWYgKGFkZXYtPnVtYy5mdW5jcyAmJgog
CSAgICBhZGV2LT51bWMuZnVuY3MtPnF1ZXJ5X3Jhc19lcnJvcl9jb3VudCkKLQkgICAgYWRldi0+
dW1jLmZ1bmNzLT5xdWVyeV9yYXNfZXJyb3JfY291bnQoYWRldiwgZXJyX2RhdGEpOworCSAgICBh
ZGV2LT51bWMuZnVuY3MtPnF1ZXJ5X3Jhc19lcnJvcl9jb3VudChhZGV2LCByYXNfZXJyb3Jfc3Rh
dHVzKTsKIAogCWlmIChhZGV2LT51bWMuZnVuY3MgJiYKIAkgICAgYWRldi0+dW1jLmZ1bmNzLT5x
dWVyeV9yYXNfZXJyb3JfYWRkcmVzcyAmJgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvc2RtYV92NF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0
XzAuYwppbmRleCBiNTM2ZjA0OTNjMjUuLjM1ZjgxYjUyZjA4OCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvc2RtYV92NF8wLmMKQEAgLTE2ODcsNyArMTY4Nyw3IEBAIHN0YXRpYyBpbnQgc2Rt
YV92NF8wX2Vhcmx5X2luaXQodm9pZCAqaGFuZGxlKQogfQogCiBzdGF0aWMgaW50IHNkbWFfdjRf
MF9wcm9jZXNzX3Jhc19kYXRhX2NiKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAotCQlzdHJ1
Y3QgcmFzX2Vycl9kYXRhICplcnJfZGF0YSwKKwkJdm9pZCAqZXJyX2RhdGEsCiAJCXN0cnVjdCBh
bWRncHVfaXZfZW50cnkgKmVudHJ5KTsKIAogc3RhdGljIGludCBzZG1hX3Y0XzBfbGF0ZV9pbml0
KHZvaWQgKmhhbmRsZSkKQEAgLTE5MzYsNyArMTkzNiw3IEBAIHN0YXRpYyBpbnQgc2RtYV92NF8w
X3Byb2Nlc3NfdHJhcF9pcnEoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiB9CiAKIHN0YXRp
YyBpbnQgc2RtYV92NF8wX3Byb2Nlc3NfcmFzX2RhdGFfY2Ioc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCi0JCXN0cnVjdCByYXNfZXJyX2RhdGEgKmVycl9kYXRhLAorCQl2b2lkICplcnJfZGF0
YSwKIAkJc3RydWN0IGFtZGdwdV9pdl9lbnRyeSAqZW50cnkpCiB7CiAJdWludDMyX3QgZXJyX3Nv
dXJjZTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
