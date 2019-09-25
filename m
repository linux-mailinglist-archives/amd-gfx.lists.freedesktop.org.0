Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31256BE46F
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2019 20:15:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD936890B8;
	Wed, 25 Sep 2019 18:15:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760073.outbound.protection.outlook.com [40.107.76.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF11F6EC73
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 18:15:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UpkMYo+GigsktDTayCZ6cXfGJB9W3pMNcpnN7YgvF9XbnOIsjTTDo5fwGhXlPk4uiZrtWAUh7NWz1NeSO+9ruoLR9uHmzYUP13fqJ//nxLfJkzZN2js87C66/qqahBezeD9VF3BCoOQ0kaopw6rq2LsEvUf5Y5/zKncCR4qMLdcGToIraLOG4Ir0N65N+3KX1ZLu6dlRk5uYOIaHF4IezqWgqo4r50mIXHkCNcH/tQkPuVVzOFz0tvqAKsR/p7FMjamj+OUpwqxXj/p4EpBLv88KxVHUFaWV8AURwbCUdepGjmmwjdSNCLGgDiXWVDxk872gP+ZiNgYHq2B7vvGhIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ET8iVZ0K4vkaIFZfMQvZ87k+Vz0Tk4AJHVQjnGLN8/A=;
 b=ULUHs1Iuqkz+M03B8+j8j7+hdUHpkb0SJY+e0sBfwsBTZmGILfxBC1Po3s+adfL3uMnT8vU7CF0CO/4rGkOtOXGn2V1CVaoh4VtzfAFZ4xwSDvSWLfCbVJ+3KRgivWHWuHizu7lZrWvtCB6OAn7B/xOWkNE/cZ1vKEutE8BNy6Lo0yw9mqH3rALL23HkmMUsErPLYDrGyGUuxf1wa2WGhP/Y6ltAKbigjAH8cM5P1duw+CuUiZ5WBSNeIeGqNPekvUVPDmpaQ5rPK3i1iZo9eRB1YAb8sYPaOk03RThS5mBdmFoOmP2YX5GUt7D/WX+TL6ZuCsP8bXrell33NDmF3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB2681.namprd12.prod.outlook.com (20.176.116.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.21; Wed, 25 Sep 2019 18:15:45 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 18:15:45 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/amdkfd: Remove the control stack workaround for GFX10
Thread-Topic: [PATCH 3/3] drm/amdkfd: Remove the control stack workaround for
 GFX10
Thread-Index: AQHVc80/rILqZ5+AA0KhlrYPxnfn6g==
Date: Wed, 25 Sep 2019 18:15:45 +0000
Message-ID: <20190925181527.17091-3-Yong.Zhao@amd.com>
References: <20190925181527.17091-1-Yong.Zhao@amd.com>
In-Reply-To: <20190925181527.17091-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::14) To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77f5f06e-6142-437f-4710-08d741e4621b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB2681; 
x-ms-traffictypediagnostic: DM6PR12MB2681:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2681A4C2D6C6DA2EA2AB738EF0870@DM6PR12MB2681.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:328;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(189003)(199004)(6512007)(486006)(36756003)(8936002)(2906002)(476003)(6116002)(6916009)(50226002)(305945005)(7736002)(1076003)(11346002)(66066001)(2351001)(102836004)(386003)(26005)(2501003)(4326008)(3846002)(71190400001)(71200400001)(66556008)(81156014)(66946007)(64756008)(6486002)(2616005)(76176011)(446003)(99286004)(86362001)(6506007)(5640700003)(6436002)(186003)(14444005)(14454004)(81166006)(8676002)(66476007)(52116002)(25786009)(66446008)(256004)(316002)(5660300002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2681;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wBNrlfzF5H3CgA1R16oBmHoz3YdbWVDp1UgHJTRuYQcrQvd7uSpKhjEswGdhYcPJkL3NExLcpVEr+0sr3FOYDYzdB0vZOemuWYkPkuW4OMYBuMDNwNeea6w+cWKRgfmfcpvAkRsFEXJl3hMJTr5mvASIQw+r7crAA5mMa/HeXiUIC0fTxQtBEDmU9QTeu5ZcmuhKOKjyQF9aLjQVL93vhPe9rpUhNHi8pWaOdDpXLZYrj8rqWsk0geC3wULqXjrDencTEB0fdS9LW6eXHd9Uo7J/TukRs7dDucsSW9M6kMUOeJR9CLBDfbUKsVhf0EWIkVoHQRWJSb6qpYQd3fvuewK43H9nrICCc21vuXZ8O/putaqOiFOvc8CNsN4EigBVIgqBylDvBJN1x3Iiv66kPNSFAJn7o5vt47JsXsUOuK0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f5f06e-6142-437f-4710-08d741e4621b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 18:15:45.2517 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lEtXLylpXS32XVadtjsGpWVtQnoKYZ+iHrkbVUx8t5YbQJ5s6xrRR14ystBGQ/03
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2681
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ET8iVZ0K4vkaIFZfMQvZ87k+Vz0Tk4AJHVQjnGLN8/A=;
 b=KDezuajsDOSicamBczzZa064XnDFZH9bInCIvxe46AGhySG9dsqwN9vPv9qsGhGkj84JimpPRZ1jSxpFD1yoxI9bruwBZEhsGeLTcHexYX5ORs5/TfF6inBaKStQsJ8WqhowXam7+1R3vxxZjN2TKLIciMpbLRVfq8a/RaOtvcU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIEdGWDEwIGRvZXMgbm90IGhhdmUgdGhpcyBoYXJkd2FyZSBidWcgYW55IG1vcmUsIHNvIHJl
bW92ZSBpdC4KCkNoYW5nZS1JZDogSTQ0NmM5Njg1NTQ5YTA5YWM4ODQ2YTQyZWUyMmQ4NmNmYjkz
ZmQ5OGMKU2lnbmVkLW9mZi1ieTogWW9uZyBaaGFvIDxZb25nLlpoYW9AYW1kLmNvbT4KLS0tCiAu
Li4vZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9tcWRfbWFuYWdlcl92MTAuYyAgfCAzNyArKy0tLS0t
LS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzMyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFkX21h
bmFnZXJfdjEwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJf
djEwLmMKaW5kZXggOWNkM2ViMmQ5MGJkLi40YTIzNmIyYzIzNTQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9tcWRfbWFuYWdlcl92MTAuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfdjEwLmMKQEAgLTY5LDM1ICs2OSwx
MyBAQCBzdGF0aWMgdm9pZCB1cGRhdGVfY3VfbWFzayhzdHJ1Y3QgbXFkX21hbmFnZXIgKm1tLCB2
b2lkICptcWQsCiBzdGF0aWMgc3RydWN0IGtmZF9tZW1fb2JqICphbGxvY2F0ZV9tcWQoc3RydWN0
IGtmZF9kZXYgKmtmZCwKIAkJc3RydWN0IHF1ZXVlX3Byb3BlcnRpZXMgKnEpCiB7Ci0JaW50IHJl
dHZhbDsKLQlzdHJ1Y3Qga2ZkX21lbV9vYmogKm1xZF9tZW1fb2JqID0gTlVMTDsKKwlzdHJ1Y3Qg
a2ZkX21lbV9vYmogKm1xZF9tZW1fb2JqOwogCi0JLyogRnJvbSBWOSwgIGZvciBDV1NSLCB0aGUg
Y29udHJvbCBzdGFjayBpcyBsb2NhdGVkIG9uIHRoZSBuZXh0IHBhZ2UKLQkgKiBib3VuZGFyeSBh
ZnRlciB0aGUgbXFkLCB3ZSB3aWxsIHVzZSB0aGUgZ3R0IGFsbG9jYXRpb24gZnVuY3Rpb24KLQkg
KiBpbnN0ZWFkIG9mIHN1Yi1hbGxvY2F0aW9uIGZ1bmN0aW9uLgotCSAqLwotCWlmIChrZmQtPmN3
c3JfZW5hYmxlZCAmJiAocS0+dHlwZSA9PSBLRkRfUVVFVUVfVFlQRV9DT01QVVRFKSkgewotCQlt
cWRfbWVtX29iaiA9IGt6YWxsb2Moc2l6ZW9mKHN0cnVjdCBrZmRfbWVtX29iaiksIEdGUF9OT0lP
KTsKLQkJaWYgKCFtcWRfbWVtX29iaikKLQkJCXJldHVybiBOVUxMOwotCQlyZXR2YWwgPSBhbWRn
cHVfYW1ka2ZkX2FsbG9jX2d0dF9tZW0oa2ZkLT5rZ2QsCi0JCQlBTElHTihxLT5jdGxfc3RhY2tf
c2l6ZSwgUEFHRV9TSVpFKSArCi0JCQkJQUxJR04oc2l6ZW9mKHN0cnVjdCB2MTBfY29tcHV0ZV9t
cWQpLCBQQUdFX1NJWkUpLAotCQkJJihtcWRfbWVtX29iai0+Z3R0X21lbSksCi0JCQkmKG1xZF9t
ZW1fb2JqLT5ncHVfYWRkciksCi0JCQkodm9pZCAqKSYobXFkX21lbV9vYmotPmNwdV9wdHIpLCB0
cnVlKTsKLQl9IGVsc2UgewotCQlyZXR2YWwgPSBrZmRfZ3R0X3NhX2FsbG9jYXRlKGtmZCwgc2l6
ZW9mKHN0cnVjdCB2MTBfY29tcHV0ZV9tcWQpLAotCQkJCSZtcWRfbWVtX29iaik7Ci0JfQotCi0J
aWYgKHJldHZhbCkgewotCQlrZnJlZShtcWRfbWVtX29iaik7CisJaWYgKGtmZF9ndHRfc2FfYWxs
b2NhdGUoa2ZkLCBzaXplb2Yoc3RydWN0IHYxMF9jb21wdXRlX21xZCksCisJCQkmbXFkX21lbV9v
YmopKQogCQlyZXR1cm4gTlVMTDsKLQl9CiAKIAlyZXR1cm4gbXFkX21lbV9vYmo7Ci0KIH0KIAog
c3RhdGljIHZvaWQgaW5pdF9tcWQoc3RydWN0IG1xZF9tYW5hZ2VyICptbSwgdm9pZCAqKm1xZCwK
QEAgLTI1MCwxNCArMjI4LDcgQEAgc3RhdGljIGludCBkZXN0cm95X21xZChzdHJ1Y3QgbXFkX21h
bmFnZXIgKm1tLCB2b2lkICptcWQsCiBzdGF0aWMgdm9pZCBmcmVlX21xZChzdHJ1Y3QgbXFkX21h
bmFnZXIgKm1tLCB2b2lkICptcWQsCiAJCQlzdHJ1Y3Qga2ZkX21lbV9vYmogKm1xZF9tZW1fb2Jq
KQogewotCXN0cnVjdCBrZmRfZGV2ICprZmQgPSBtbS0+ZGV2OwotCi0JaWYgKG1xZF9tZW1fb2Jq
LT5ndHRfbWVtKSB7Ci0JCWFtZGdwdV9hbWRrZmRfZnJlZV9ndHRfbWVtKGtmZC0+a2dkLCBtcWRf
bWVtX29iai0+Z3R0X21lbSk7Ci0JCWtmcmVlKG1xZF9tZW1fb2JqKTsKLQl9IGVsc2UgewotCQlr
ZmRfZ3R0X3NhX2ZyZWUobW0tPmRldiwgbXFkX21lbV9vYmopOwotCX0KKwlrZmRfZ3R0X3NhX2Zy
ZWUobW0tPmRldiwgbXFkX21lbV9vYmopOwogfQogCiBzdGF0aWMgYm9vbCBpc19vY2N1cGllZChz
dHJ1Y3QgbXFkX21hbmFnZXIgKm1tLCB2b2lkICptcWQsCi0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
