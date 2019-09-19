Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA8FB73C7
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 09:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5745F6F8F1;
	Thu, 19 Sep 2019 07:12:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740053.outbound.protection.outlook.com [40.107.74.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5FD86F8D8
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 07:12:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bryeFPRfLlYq/OMLOzhXU3gHGjYiOLy1Lp427VOG1ReqZTSl7EcShb0QG5lVuKpnEvD76kqZAI8MXowGN0f0j8SxaWXnnHOjcPlN6jYpl8sYhLjQXba1sagoSeHTJ3gJOLDiHcFSbX6MMbCFGQ5UY3zyBhovnDPA5CN/7e5gpDr67dRcuOwFIMtdWgKdJodynVgYwD6apFbDvB2bHyPRYETnabhA8MNR+C7F7HWem5RdmSOrfj+eReWHluHfz4qpwZiRNQdjXEvUfMaZVRys4yGTzOtgIQUmmWbW4XMxcMsC5WiIU7TjB6RcLIi5XRSSWd0/8cfJDrnU3yhuCCpOig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16eevsdk617NiPF7XrO27JeD5GJSUa3G7lnUeZmoVbE=;
 b=nak3aKcACBTAk6O2vjjM8pw5kWFzuHIPw+9/npRKBWs/sYhiULtlv9zdq2ye9RZJMKvTq9YwR+FQViTIe9/d93kUc+O66JwwpbojFM3INaecIUrjWW2K/rHk48SBivgKDhc216xqPsTfYw2xD32hMsyKoUejgqMayVnwB6HTttarfYQl4dZTNkV5PTUTksb20F2ljwm95cNSyAPZ9wdQBNDOuDC1D6bS8VPYod07/A/g0bjfoeyAfqW/bINsuGMmrusKDN+MhbURhAxv1I6EnqXDt6Az2bbGvQe218rDhJrwZHd4uy/Ps8OAwsHYLxQVP9245+TQiW0vzUzhKFAObg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3440.namprd12.prod.outlook.com (20.178.244.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Thu, 19 Sep 2019 07:12:42 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 07:12:42 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH 06/21] drm/amdgpu: move umc_ras_if from gmc to umc block
Thread-Topic: [PATCH 06/21] drm/amdgpu: move umc_ras_if from gmc to umc block
Thread-Index: AQHVbrmgv9QYm4qSV06Xw+VQBrKtkA==
Date: Thu, 19 Sep 2019 07:12:41 +0000
Message-ID: <20190919071115.16552-7-tao.zhou1@amd.com>
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
x-ms-office365-filtering-correlation-id: 1219634b-1570-47a9-a19c-08d73cd0c2e0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3440; 
x-ms-traffictypediagnostic: MN2PR12MB3440:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3440F33F45E78FA384D2B32DB0890@MN2PR12MB3440.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:44;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(199004)(189003)(25786009)(66066001)(14454004)(256004)(478600001)(6512007)(4326008)(2906002)(66946007)(66446008)(64756008)(316002)(66556008)(66476007)(6436002)(6116002)(110136005)(3846002)(6486002)(99286004)(6636002)(76176011)(2501003)(52116002)(1076003)(36756003)(5660300002)(446003)(2616005)(11346002)(476003)(305945005)(7736002)(26005)(102836004)(486006)(386003)(6506007)(186003)(8676002)(71190400001)(86362001)(71200400001)(8936002)(81156014)(50226002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3440;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bflSfPySzWmMbENZyAbbV+H/fdDjrXUll53CCNei35+3qbC6JpQfx7olK9dNHn4/gumkkyQzGbrBariXqcJAu4F/GcyockVuBoM546YDyx7IJKJn3Vz7IIlZlFRii/Ipudf38oBOqlzGwV7qqd42C/PXsytM7u6BLzJxiBkpH6mGBAegPB5oYSnxxHqFr75cVslZQxrqEFs1Ws3sf6/Bj5Ngbmn3EdgP+xPzrAHq7aTwaEHtmDGFciiy46qHpiA+ax2AfH1e/UanoxOYo2AVhoXBdKFAaNL1WAoQi4H0lIf5qPDsh35Ghsc9fx5QHfLxE8ZBpaSYmssipW/ZnGVypIYlb3hAZmsaRNLoo6chDtLn9af2Tc4RWzUfem9RLaIQZLvxeWyXi53I5kaFZxMaDip5JUxBEYL36PxwI4A4Uv8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1219634b-1570-47a9-a19c-08d73cd0c2e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 07:12:42.1257 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EpDdvpmu4l7cWbnu9GfGjWaruBMKP1Ro+lvXh5IN9i1GXYNQkCJ92Ff3ae4XVIiE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3440
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16eevsdk617NiPF7XrO27JeD5GJSUa3G7lnUeZmoVbE=;
 b=EJwdkdbTQwObSx3zQi+eslm5p10M19wjCBORwkR2sLmAhkb4FkZhvS6qVrp+h2KX0VG/K7F1FrnMfHPcGonv02QvhrIE5MmJ0Uwyt9WgD9YZFXKl+WyaOAqV1HIghtiXW6lNy0Z1nFLvlZD5qCjEbSLDXA4dZ5FKiu4xgqVP1HU=
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

dW1jX3Jhc19pZiBpcyByZWxldmFudCB0byB1bWMKClNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0
YW8uemhvdTFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Z21jLmggfCAgMSAtCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmMgfCAy
OCArKysrKysrKysrKystLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdW1jLmggfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5j
ICAgfCAgNCArKy0tCiA0IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDE3IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9n
bWMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuaAppbmRleCBiMzZk
NGM2ODY4NDQuLjUyNGRmMTU0YTVhZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2dtYy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9nbWMuaApAQCAtMTgxLDcgKzE4MSw2IEBAIHN0cnVjdCBhbWRncHVfZ21jIHsKIAogCXN0cnVj
dCBhbWRncHVfeGdtaSB4Z21pOwogCXN0cnVjdCBhbWRncHVfaXJxX3NyYwllY2NfaXJxOwotCXN0
cnVjdCByYXNfY29tbW9uX2lmICAgICp1bWNfcmFzX2lmOwogCXN0cnVjdCByYXNfY29tbW9uX2lm
ICAgICptbWh1Yl9yYXNfaWY7CiB9OwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdW1jLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dW1jLmMKaW5kZXggZDExYjRkMzhjYTFlLi5hY2MwYzQyOGY2ZmEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdW1jLmMKQEAgLTM1LDI0ICszNSwyNCBAQCBpbnQgYW1kZ3B1X3Vt
Y19yYXNfbGF0ZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB2b2lkICpyYXNfaWhf
aW5mbykKIAlpZiAoIWloX2luZm8pCiAJCXJldHVybiAtRUlOVkFMOwogCi0JaWYgKCFhZGV2LT5n
bWMudW1jX3Jhc19pZikgewotCQlhZGV2LT5nbWMudW1jX3Jhc19pZiA9CisJaWYgKCFhZGV2LT51
bWMucmFzX2lmKSB7CisJCWFkZXYtPnVtYy5yYXNfaWYgPQogCQkJa21hbGxvYyhzaXplb2Yoc3Ry
dWN0IHJhc19jb21tb25faWYpLCBHRlBfS0VSTkVMKTsKLQkJaWYgKCFhZGV2LT5nbWMudW1jX3Jh
c19pZikKKwkJaWYgKCFhZGV2LT51bWMucmFzX2lmKQogCQkJcmV0dXJuIC1FTk9NRU07Ci0JCWFk
ZXYtPmdtYy51bWNfcmFzX2lmLT5ibG9jayA9IEFNREdQVV9SQVNfQkxPQ0tfX1VNQzsKLQkJYWRl
di0+Z21jLnVtY19yYXNfaWYtPnR5cGUgPSBBTURHUFVfUkFTX0VSUk9SX19NVUxUSV9VTkNPUlJF
Q1RBQkxFOwotCQlhZGV2LT5nbWMudW1jX3Jhc19pZi0+c3ViX2Jsb2NrX2luZGV4ID0gMDsKLQkJ
c3RyY3B5KGFkZXYtPmdtYy51bWNfcmFzX2lmLT5uYW1lLCAidW1jIik7CisJCWFkZXYtPnVtYy5y
YXNfaWYtPmJsb2NrID0gQU1ER1BVX1JBU19CTE9DS19fVU1DOworCQlhZGV2LT51bWMucmFzX2lm
LT50eXBlID0gQU1ER1BVX1JBU19FUlJPUl9fTVVMVElfVU5DT1JSRUNUQUJMRTsKKwkJYWRldi0+
dW1jLnJhc19pZi0+c3ViX2Jsb2NrX2luZGV4ID0gMDsKKwkJc3RyY3B5KGFkZXYtPnVtYy5yYXNf
aWYtPm5hbWUsICJ1bWMiKTsKIAl9Ci0JaWhfaW5mby0+aGVhZCA9IGZzX2luZm8uaGVhZCA9ICph
ZGV2LT5nbWMudW1jX3Jhc19pZjsKKwlpaF9pbmZvLT5oZWFkID0gZnNfaW5mby5oZWFkID0gKmFk
ZXYtPnVtYy5yYXNfaWY7CiAKLQlyID0gYW1kZ3B1X3Jhc19sYXRlX2luaXQoYWRldiwgYWRldi0+
Z21jLnVtY19yYXNfaWYsCisJciA9IGFtZGdwdV9yYXNfbGF0ZV9pbml0KGFkZXYsIGFkZXYtPnVt
Yy5yYXNfaWYsCiAJCQkJICZmc19pbmZvLCBpaF9pbmZvKTsKIAlpZiAocikKIAkJZ290byBmcmVl
OwogCi0JaWYgKGFtZGdwdV9yYXNfaXNfc3VwcG9ydGVkKGFkZXYsIGFkZXYtPmdtYy51bWNfcmFz
X2lmLT5ibG9jaykpIHsKKwlpZiAoYW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQoYWRldiwgYWRldi0+
dW1jLnJhc19pZi0+YmxvY2spKSB7CiAJCXIgPSBhbWRncHVfaXJxX2dldChhZGV2LCAmYWRldi0+
Z21jLmVjY19pcnEsIDApOwogCQlpZiAocikKIAkJCWdvdG8gbGF0ZV9maW5pOwpAQCAtNjgsMTAg
KzY4LDEwIEBAIGludCBhbWRncHVfdW1jX3Jhc19sYXRlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsIHZvaWQgKnJhc19paF9pbmZvKQogCXJldHVybiAwOwogCiBsYXRlX2Zpbmk6Ci0J
YW1kZ3B1X3Jhc19sYXRlX2ZpbmkoYWRldiwgYWRldi0+Z21jLnVtY19yYXNfaWYsIGloX2luZm8p
OworCWFtZGdwdV9yYXNfbGF0ZV9maW5pKGFkZXYsIGFkZXYtPnVtYy5yYXNfaWYsIGloX2luZm8p
OwogZnJlZToKLQlrZnJlZShhZGV2LT5nbWMudW1jX3Jhc19pZik7Ci0JYWRldi0+Z21jLnVtY19y
YXNfaWYgPSBOVUxMOworCWtmcmVlKGFkZXYtPnVtYy5yYXNfaWYpOworCWFkZXYtPnVtYy5yYXNf
aWYgPSBOVUxMOwogCXJldHVybiByOwogfQogCkBAIC0xMjUsNyArMTI1LDcgQEAgaW50IGFtZGdw
dV91bWNfcHJvY2Vzc19lY2NfaXJxKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQlzdHJ1
Y3QgYW1kZ3B1X2lycV9zcmMgKnNvdXJjZSwKIAkJc3RydWN0IGFtZGdwdV9pdl9lbnRyeSAqZW50
cnkpCiB7Ci0Jc3RydWN0IHJhc19jb21tb25faWYgKnJhc19pZiA9IGFkZXYtPmdtYy51bWNfcmFz
X2lmOworCXN0cnVjdCByYXNfY29tbW9uX2lmICpyYXNfaWYgPSBhZGV2LT51bWMucmFzX2lmOwog
CXN0cnVjdCByYXNfZGlzcGF0Y2hfaWYgaWhfZGF0YSA9IHsKIAkJLmVudHJ5ID0gZW50cnksCiAJ
fTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMuaCBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMuaAppbmRleCA4NGI4Yjc5MmIx
M2EuLmEyNmVmNDkyMzkzMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3VtYy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMu
aApAQCAtNzYsNiArNzYsNyBAQCBzdHJ1Y3QgYW1kZ3B1X3VtYyB7CiAJdWludDMyX3QgY2hhbm5l
bF9vZmZzOwogCS8qIGNoYW5uZWwgaW5kZXggdGFibGUgb2YgaW50ZXJsZWF2ZWQgbWVtb3J5ICov
CiAJY29uc3QgdWludDMyX3QgKmNoYW5uZWxfaWR4X3RibDsKKwlzdHJ1Y3QgcmFzX2NvbW1vbl9p
ZiAqcmFzX2lmOwogCiAJY29uc3Qgc3RydWN0IGFtZGdwdV91bWNfZnVuY3MgKmZ1bmNzOwogfTsK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCmluZGV4IGU0ZTA5MTJkNmI3OC4uZGU0
ZjIwMDI4YWZiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlf
MC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKQEAgLTExMTQs
OCArMTExNCw4IEBAIHN0YXRpYyBpbnQgZ21jX3Y5XzBfc3dfZmluaSh2b2lkICpoYW5kbGUpCiAJ
dm9pZCAqc3RvbGVuX3ZnYV9idWY7CiAKIAlpZiAoYW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQoYWRl
diwgQU1ER1BVX1JBU19CTE9DS19fVU1DKSAmJgotCQkJYWRldi0+Z21jLnVtY19yYXNfaWYpIHsK
LQkJc3RydWN0IHJhc19jb21tb25faWYgKnJhc19pZiA9IGFkZXYtPmdtYy51bWNfcmFzX2lmOwor
CQkJYWRldi0+dW1jLnJhc19pZikgeworCQlzdHJ1Y3QgcmFzX2NvbW1vbl9pZiAqcmFzX2lmID0g
YWRldi0+dW1jLnJhc19pZjsKIAkJc3RydWN0IHJhc19paF9pZiBpaF9pbmZvID0gewogCQkJLmhl
YWQgPSAqcmFzX2lmLAogCQl9OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
