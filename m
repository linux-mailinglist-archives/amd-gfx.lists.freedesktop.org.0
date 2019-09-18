Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B7CB5A24
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Sep 2019 05:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F323B6EDDB;
	Wed, 18 Sep 2019 03:37:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790082.outbound.protection.outlook.com [40.107.79.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15286EDDB
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Sep 2019 03:37:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/YhE/jCJGa61Gu/dnaYpkT8bAdWfw4pu8CNxZalgcLB08+jVX2EWcyQiIzjCvnbcf3WfUmOx1gycmfh/i7rRtyN/luYzzIiyPqJURVGI9voDSwClUSFEfhxMhORTU+ep6yJOvyHoH7+e1w1SDBlPAwZZ7zJcLX5sENmsU/54DocV3JKiE7kWS+3kzN+ZiBObFSXUBY5nSdaLrhnERUnGsKccRk+yW6Wk978nb4habGqXBJV/FuddpV4ul0J8kQZOUopsr39xxImUXr4GcgmMbu7DWUGgDwFdVEbNyOPBKROC6XxXx36vnh9fm0JT7VSiXvay/T5XdBDxVmvvROOmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SX+JMwuQKKrA/zQxcHaBlLTp+iHq2mzOu67SuWxwUFI=;
 b=h+uMH3vCBgo0E7kMxYfh73pVG/I/B4gBSlycub9duwrKyo8KCTWV+jkadJFj/oDSUNWUbblhAasBoqI5rWE0KpiMXnItR4lLmp/xdLs7mKEkdolYcBSUThUHYp06J2U2pPfdlBnCVagOWmSoZgP2c5KmoGr+yLGgAr7CDbIBMeyzvmfbAiJzkMtFl/5RU7hDInFpLngX9icYPZVehOP3qUC6rKtit+m6Xs9f3yRnS4mVoFMJ7lBoW+F+kjte/OA+gaQ2jVIhmi1tUYR3ePEtZEHLeCF0cTZLd+lgP/UxAu1la1FCCpTRWrB6rNb/Re4C5EfBqB4Rt7aOLoFzaXxSZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB3478.namprd12.prod.outlook.com (20.178.196.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Wed, 18 Sep 2019 03:37:49 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11%7]) with mapi id 15.20.2263.023; Wed, 18 Sep 2019
 03:37:49 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
Subject: [PATCH 2/2] drm/amdgpu: remove redundant variable definition
Thread-Topic: [PATCH 2/2] drm/amdgpu: remove redundant variable definition
Thread-Index: AQHVbdJxP5WlEA3+pE+qWBWxPRXI/w==
Date: Wed, 18 Sep 2019 03:37:49 +0000
Message-ID: <20190918033721.19070-2-guchun.chen@amd.com>
References: <20190918033721.19070-1-guchun.chen@amd.com>
In-Reply-To: <20190918033721.19070-1-guchun.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR04CA0047.apcprd04.prod.outlook.com
 (2603:1096:202:14::15) To BYAPR12MB2806.namprd12.prod.outlook.com
 (2603:10b6:a03:70::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e84e903-81b3-485a-0f75-08d73be993f1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BYAPR12MB3478; 
x-ms-traffictypediagnostic: BYAPR12MB3478:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3478E91006C3E5CB23BC30C1F18E0@BYAPR12MB3478.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(366004)(346002)(189003)(199004)(26005)(305945005)(81166006)(11346002)(478600001)(2616005)(1076003)(186003)(386003)(36756003)(6116002)(52116002)(6506007)(81156014)(4326008)(66066001)(316002)(102836004)(2906002)(25786009)(3846002)(2501003)(71200400001)(71190400001)(99286004)(8936002)(476003)(486006)(66446008)(66946007)(50226002)(66556008)(66476007)(64756008)(446003)(110136005)(6512007)(76176011)(14454004)(6436002)(7736002)(5660300002)(6486002)(6636002)(86362001)(256004)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3478;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pV6uJiKsDDA0zKiKXTF9joleHiW7FGyQDROFh6Id6FRTwXmDLx7k3eP7Ebudzdq2j/ijkEVE1hy+9L6gURT6+EqppWCOwOY+VzDiYKqcjHip2NfoBwY+5oDUkNjsDdfpwVurdimvQV0lVCKC0HA7l4O0MbyuPqYDMj3lFBvdgT8D0MmRmd3k9vxMnI83kawnj2c7HRdommU0q5r/teb+ThgQ0tDbL6uuQdMAsHXEE69aJvxWwSHjq8DHWC6lcLr4B7pG4lR1iQ2R38krBx2ROKL83Xh4BZWTJ+GGvT35osVlyHf0jWe5wpHi70pQ2Y0Guv6q2lZOt52blvOog3Mz6VASSCrLAsGB7olqHBd5fESZMBiH+iqDqVNd81UavAmkTaFZMD1oGavnxYwcsVSUM2/iLBUAuMpN2ruFlm71zk4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e84e903-81b3-485a-0f75-08d73be993f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 03:37:49.5340 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8BzMshFBeWdsWKT7SZQ1jrM7FRC6Vw/8Qjh5FdYNWGd45YR3Z9xpoI0vbkH42WCLjIzQ/6JkiIHNfofh6Aa8uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3478
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SX+JMwuQKKrA/zQxcHaBlLTp+iHq2mzOu67SuWxwUFI=;
 b=M0x7VDf0z4YPyFqEzt14dL+8i4yUxzNPvkM6/Q28uPLHvewkRCJdYI33CljTdEyFXVoo84crlkTpkelauDycnBbyKb133VEwqG8Om2JBWcEUXsyIAs1BNys/PV/1+6EhOSNaUDIql9sT0ZNZaf2LS6an3jx4DwBAa5l7+J4BBWE=
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
Cc: "Chen, Guchun" <Guchun.Chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Tm8gbmVlZCB0byBkZWZpbmUgdGhlIHNhbWUgdmFyaWFibGVzIGluIGVhY2ggbG9vcCBvZiB0aGUg
ZnVuY3Rpb24uCgpDaGFuZ2UtSWQ6IElkOGJiY2M1YTJhYzg3ZTlkMzFhNzIyNDQzNDVmZGUyZDZi
Yjk5ZDQyClNpZ25lZC1vZmYtYnk6IEd1Y2h1biBDaGVuIDxndWNodW4uY2hlbkBhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9tLmMgfCAxNSAr
KysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jh
c19lZXByb20uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9t
LmMKaW5kZXggZDBlMDIwZWY3M2UzLi4yMGFmMGExN2QwMGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9tLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhc19lZXByb20uYwpAQCAtMzU5LDggKzM1OSw5IEBAIGlu
dCBhbWRncHVfcmFzX2VlcHJvbV9wcm9jZXNzX3JlY29kcyhzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXBy
b21fY29udHJvbCAqY29udHJvbCwKIAkJCQkJICAgIGludCBudW0pCiB7CiAJaW50IGksIHJldCA9
IDA7Ci0Jc3RydWN0IGkyY19tc2cgKm1zZ3M7Ci0JdW5zaWduZWQgY2hhciAqYnVmZnM7CisJc3Ry
dWN0IGkyY19tc2cgKm1zZ3MsICptc2c7CisJdW5zaWduZWQgY2hhciAqYnVmZnMsICpidWZmOwor
CXN0cnVjdCBlZXByb21fdGFibGVfcmVjb3JkICpyZWNvcmQ7CiAJc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYgPSB0b19hbWRncHVfZGV2aWNlKGNvbnRyb2wpOwogCiAJaWYgKGFkZXYtPmFzaWNf
dHlwZSAhPSBDSElQX1ZFR0EyMCkKQEAgLTM5MCw5ICszOTEsOSBAQCBpbnQgYW1kZ3B1X3Jhc19l
ZXByb21fcHJvY2Vzc19yZWNvZHMoc3RydWN0IGFtZGdwdV9yYXNfZWVwcm9tX2NvbnRyb2wgKmNv
bnRyb2wsCiAJICogMjU2YgogCSAqLwogCWZvciAoaSA9IDA7IGkgPCBudW07IGkrKykgewotCQl1
bnNpZ25lZCBjaGFyICpidWZmID0gJmJ1ZmZzW2kgKiAoRUVQUk9NX0FERFJFU1NfU0laRSArIEVF
UFJPTV9UQUJMRV9SRUNPUkRfU0laRSldOwotCQlzdHJ1Y3QgZWVwcm9tX3RhYmxlX3JlY29yZCAq
cmVjb3JkID0gJnJlY29yZHNbaV07Ci0JCXN0cnVjdCBpMmNfbXNnICptc2cgPSAmbXNnc1tpXTsK
KwkJYnVmZiA9ICZidWZmc1tpICogKEVFUFJPTV9BRERSRVNTX1NJWkUgKyBFRVBST01fVEFCTEVf
UkVDT1JEX1NJWkUpXTsKKwkJcmVjb3JkID0gJnJlY29yZHNbaV07CisJCW1zZyA9ICZtc2dzW2ld
OwogCiAJCWNvbnRyb2wtPm5leHRfYWRkciA9IF9fY29ycmVjdF9lZXByb21fZGVzdF9hZGRyZXNz
KGNvbnRyb2wtPm5leHRfYWRkcik7CiAKQEAgLTQzMiw4ICs0MzMsOCBAQCBpbnQgYW1kZ3B1X3Jh
c19lZXByb21fcHJvY2Vzc19yZWNvZHMoc3RydWN0IGFtZGdwdV9yYXNfZWVwcm9tX2NvbnRyb2wg
KmNvbnRyb2wsCiAKIAlpZiAoIXdyaXRlKSB7CiAJCWZvciAoaSA9IDA7IGkgPCBudW07IGkrKykg
ewotCQkJdW5zaWduZWQgY2hhciAqYnVmZiA9ICZidWZmc1tpKihFRVBST01fQUREUkVTU19TSVpF
ICsgRUVQUk9NX1RBQkxFX1JFQ09SRF9TSVpFKV07Ci0JCQlzdHJ1Y3QgZWVwcm9tX3RhYmxlX3Jl
Y29yZCAqcmVjb3JkID0gJnJlY29yZHNbaV07CisJCQlidWZmID0gJmJ1ZmZzW2kqKEVFUFJPTV9B
RERSRVNTX1NJWkUgKyBFRVBST01fVEFCTEVfUkVDT1JEX1NJWkUpXTsKKwkJCXJlY29yZCA9ICZy
ZWNvcmRzW2ldOwogCiAJCQlfX2RlY29kZV90YWJsZV9yZWNvcmRfZnJvbV9idWZmKGNvbnRyb2ws
IHJlY29yZCwgYnVmZiArIEVFUFJPTV9BRERSRVNTX1NJWkUpOwogCQl9Ci0tIAoyLjE3LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
