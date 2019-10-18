Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C7ADD041
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2019 22:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4C86E0D8;
	Fri, 18 Oct 2019 20:29:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770041.outbound.protection.outlook.com [40.107.77.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782446E0D8
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2019 20:29:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8eIGiCy8AG6zgV9Q80mQbE9Khnwr3fwEsGatjcOc4lMqkmzpjBD0BYZRUmG5GdgWs/KhyT1EkwrpynJ/cuPHBh3DIHl9DiEJMrNMCON/8MZtTgeB9qy1jBcQxshujc5GtDx0UI/tULVFFhbyB3tzfG83Qoa66JK0T6hOl2G7WL+P9agUTdoPSSPvMGFeCqQwNsNtGwnOWrLwq3Ad0SfrPVgA7FicBKPyy9xveg+EjldN+0pDpA63Py0AQUCb7JFbXy8kG/rEnTbkY9IjyaeTvCHiVPJO2BploiVrWRIqIGncuqlcbIInfohEuX6/8qv4+pb8LHLsrEoKgWJcFIxjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFQC1gAlywPY9gX6cgYfL7vTaUMLVF4MTuLH91YTbeY=;
 b=E251NILq84n3NeSW+6cni4Xt6yiJ5MGpvDyNouqw1H/0h0IjSk0FRglEWy6vajJMTQUHbYwyjvezwGUjVZbEUULlROUJVvrEdvzciSntJk3oVh9AWPCXM1G99AUzCwNTFil1Mu+KYzV0WlBs+9ofPU3ZD4TMdbhw9A5p7Oh/rqbzkZoqDdnpuwuMAYCkF568d43pU/wHcvL10ZOO5hDPHBSJCQGIA+KjfPs/WtDae5XzXL4+doqWqFGB3i+HVAK2wUE9d0tsAwy/4jqv/r7Acq+bSROdD0Bpf6pqOKO1F/FbgrXgII5lmoQD1NyXQzZFi3tsOoj0TQeeNRflWPDSNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB3831.namprd12.prod.outlook.com (52.132.245.141) by
 CH2PR12MB4104.namprd12.prod.outlook.com (20.180.5.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.22; Fri, 18 Oct 2019 20:29:08 +0000
Received: from CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::911:107a:8757:3994]) by CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::911:107a:8757:3994%3]) with mapi id 15.20.2367.019; Fri, 18 Oct 2019
 20:29:07 +0000
From: "Kim, Jonathan" <Jonathan.Kim@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: revert calling smu msg in df callbacks
Thread-Topic: [PATCH] drm/amdgpu: revert calling smu msg in df callbacks
Thread-Index: AQHVhfKwmfqAaOJhNUK7Z6bWDJR29w==
Date: Fri, 18 Oct 2019 20:29:07 +0000
Message-ID: <20191018202856.27133-1-jonathan.kim@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0024.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::37)
 To CH2PR12MB3831.namprd12.prod.outlook.com
 (2603:10b6:610:29::13)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 781e1e08-e55f-4d40-886c-08d75409d34d
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CH2PR12MB4104:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB410497F1997FF45533533DD4856C0@CH2PR12MB4104.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:389;
x-forefront-prvs: 01949FE337
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(39860400002)(376002)(366004)(189003)(199004)(36756003)(6916009)(6506007)(14454004)(86362001)(6116002)(3846002)(71200400001)(71190400001)(478600001)(6436002)(50226002)(186003)(5640700003)(102836004)(486006)(52116002)(99286004)(6486002)(305945005)(2616005)(26005)(476003)(386003)(7736002)(6512007)(8936002)(66066001)(2351001)(54906003)(4326008)(8676002)(2906002)(2501003)(316002)(5660300002)(1076003)(25786009)(81166006)(14444005)(66946007)(64756008)(66446008)(66556008)(66476007)(81156014)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4104;
 H:CH2PR12MB3831.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EIc8705VNoipyqC736q1z5vdnVUHGwuIc8y4x2TcdPzIwVqCkxw7FR+qNSwHu5Ir9RxkCCi+jBxfrc6H/ep7EFrQA8shU/YD5ZpeS4ol3zBS/ul8Jj9lJREmIjRJuwAT02ktWfWVCxpaNlb2tCAPH7XdnBqoy8X5WxTsZx1jYKZkTlPk/deRoAOFTbRWcPn35v2UyXZUxoL7rHPfQWhl/N3k/y9yo/CsJOXKCKtT2iwXAt0hGR3kLClbKYv7He8/13kSUFGN1wltS6ISiYwFBQiGbjAJafXDH9R5+qEUlc/PiBPn1/Ito5mocx7T8R0cAfb4YY+wcE6/MVfUyWsaSnrnt8Kp7RZq90cqimNRzYTFXo/SUtHQUwuZtMgH3eRKKt+hCweiTSYeLZl+fWgLBJaWlGHwGOhbv8eZ2pe94lI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 781e1e08-e55f-4d40-886c-08d75409d34d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2019 20:29:07.5425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IYIo2rw/kwmFHDTKh2htkme85AvtQp1jmcFp6M6K8WLr3YGMSx1B4r8bwO3ERqrR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4104
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFQC1gAlywPY9gX6cgYfL7vTaUMLVF4MTuLH91YTbeY=;
 b=i2g85QryXD66pfiHCg9RXkAolpY2tevqLvcwq+9QuZP46HJXlt0FH7OEL6W/ydNESKj2P/+fWtQuRBvWUrMHppV1ItUY7oakp/Jspq0Y4/SdQ+fK5p+nEDGzxI2Ou12JTlN+AgqJLkKwdwc6M1vZUaTS2JiDK06duGgR0apw4/Y=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jonathan.Kim@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Kim,
 Jonathan" <Jonathan.Kim@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

cmV2ZXJ0aW5nIHRoZSBmb2xsb3dpbmcgY2hhbmdlczoKY29tbWl0IDdkZDJlYjMxZmNkNSAoImRy
bS9hbWRncHU6IGZpeCBjb21waWxlciB3YXJuaW5ncyBmb3IgZGYgcGVyZm1vbnMiKQpjb21taXQg
NTQyNzVjZDE2NDlmICgiZHJtL2FtZGdwdTogZGlzYWJsZSBjLXN0YXRlcyBvbiB4Z21pIHBlcmZt
b25zIikKCnBlcmYgZXZlbnRzIHVzZSBzcGluLWxvY2tzLiAgZW1iZWRkZWQgc211IG1lc3NhZ2Vz
IGhhdmUgcG90ZW50aWFsIGxvbmcKcmVzcG9uc2UgdGltZXMgYW5kIHBvdGVudGlhbGx5IGRlYWRs
b2NrcyB0aGUgc3lzdGVtLgoKQ2hhbmdlLUlkOiBJYzM2YzM1YTYyZGVjMTE2ZDBhMmY1YjY5YzIy
YWY0ZDQxNDQ1ODY3OQpTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBLaW0gPEpvbmF0aGFuLktpbUBh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYyB8IDM4ICsr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDM2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2RmX3YzXzYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYwppbmRl
eCBlMWNmN2U5YzYxNmEuLjE2ZmJkMmJjOGFkMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZGZfdjNfNi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Rm
X3YzXzYuYwpAQCAtOTMsMjEgKzkzLDYgQEAgY29uc3Qgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCAq
ZGZfdjNfNl9hdHRyX2dyb3Vwc1tdID0gewogCQlOVUxMCiB9OwogCi1zdGF0aWMgaW50IGRmX3Yz
XzZfc2V0X2RmX2NzdGF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IGFsbG93KQot
ewotCWludCByID0gMDsKLQotCWlmIChpc19zdXBwb3J0X3N3X3NtdShhZGV2KSkgewotCQlyID0g
c211X3NldF9kZl9jc3RhdGUoJmFkZXYtPnNtdSwgYWxsb3cpOwotCX0gZWxzZSBpZiAoYWRldi0+
cG93ZXJwbGF5LnBwX2Z1bmNzCi0JCQkmJiBhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3MtPnNldF9k
Zl9jc3RhdGUpIHsKLQkJciA9IGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+c2V0X2RmX2NzdGF0
ZSgKLQkJCWFkZXYtPnBvd2VycGxheS5wcF9oYW5kbGUsIGFsbG93KTsKLQl9Ci0KLQlyZXR1cm4g
cjsKLX0KLQogc3RhdGljIHVpbnQ2NF90IGRmX3YzXzZfZ2V0X2ZpY2Eoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsCiAJCQkJIHVpbnQzMl90IGZpY2FhX3ZhbCkKIHsKQEAgLTExNyw5ICsxMDIs
NiBAQCBzdGF0aWMgdWludDY0X3QgZGZfdjNfNl9nZXRfZmljYShzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwKIAlhZGRyZXNzID0gYWRldi0+bmJpby5mdW5jcy0+Z2V0X3BjaWVfaW5kZXhfb2Zm
c2V0KGFkZXYpOwogCWRhdGEgPSBhZGV2LT5uYmlvLmZ1bmNzLT5nZXRfcGNpZV9kYXRhX29mZnNl
dChhZGV2KTsKIAotCWlmIChkZl92M182X3NldF9kZl9jc3RhdGUoYWRldiwgREZfQ1NUQVRFX0RJ
U0FMTE9XKSkKLQkJcmV0dXJuIDB4RkZGRkZGRkZGRkZGRkZGRjsKLQogCXNwaW5fbG9ja19pcnFz
YXZlKCZhZGV2LT5wY2llX2lkeF9sb2NrLCBmbGFncyk7CiAJV1JFRzMyKGFkZHJlc3MsIHNtbkRG
X1BJRV9BT05fRmFicmljSW5kaXJlY3RDb25maWdBY2Nlc3NBZGRyZXNzMyk7CiAJV1JFRzMyKGRh
dGEsIGZpY2FhX3ZhbCk7CkBAIC0xMzIsOCArMTE0LDYgQEAgc3RhdGljIHVpbnQ2NF90IGRmX3Yz
XzZfZ2V0X2ZpY2Eoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAKIAlzcGluX3VubG9ja19p
cnFyZXN0b3JlKCZhZGV2LT5wY2llX2lkeF9sb2NrLCBmbGFncyk7CiAKLQlkZl92M182X3NldF9k
Zl9jc3RhdGUoYWRldiwgREZfQ1NUQVRFX0FMTE9XKTsKLQogCXJldHVybiAoKChmaWNhZGhfdmFs
ICYgMHhGRkZGRkZGRkZGRkZGRkZGKSA8PCAzMikgfCBmaWNhZGxfdmFsKTsKIH0KIApAQCAtMTQ1
LDkgKzEyNSw2IEBAIHN0YXRpYyB2b2lkIGRmX3YzXzZfc2V0X2ZpY2Eoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsIHVpbnQzMl90IGZpY2FhX3ZhbCwKIAlhZGRyZXNzID0gYWRldi0+bmJpby5m
dW5jcy0+Z2V0X3BjaWVfaW5kZXhfb2Zmc2V0KGFkZXYpOwogCWRhdGEgPSBhZGV2LT5uYmlvLmZ1
bmNzLT5nZXRfcGNpZV9kYXRhX29mZnNldChhZGV2KTsKIAotCWlmIChkZl92M182X3NldF9kZl9j
c3RhdGUoYWRldiwgREZfQ1NUQVRFX0RJU0FMTE9XKSkKLQkJcmV0dXJuOwotCiAJc3Bpbl9sb2Nr
X2lycXNhdmUoJmFkZXYtPnBjaWVfaWR4X2xvY2ssIGZsYWdzKTsKIAlXUkVHMzIoYWRkcmVzcywg
c21uREZfUElFX0FPTl9GYWJyaWNJbmRpcmVjdENvbmZpZ0FjY2Vzc0FkZHJlc3MzKTsKIAlXUkVH
MzIoZGF0YSwgZmljYWFfdmFsKTsKQEAgLTE1Nyw5ICsxMzQsOCBAQCBzdGF0aWMgdm9pZCBkZl92
M182X3NldF9maWNhKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50MzJfdCBmaWNhYV92
YWwsCiAKIAlXUkVHMzIoYWRkcmVzcywgc21uREZfUElFX0FPTl9GYWJyaWNJbmRpcmVjdENvbmZp
Z0FjY2Vzc0RhdGFIaTMpOwogCVdSRUczMihkYXRhLCBmaWNhZGhfdmFsKTsKLQlzcGluX3VubG9j
a19pcnFyZXN0b3JlKCZhZGV2LT5wY2llX2lkeF9sb2NrLCBmbGFncyk7CiAKLQlkZl92M182X3Nl
dF9kZl9jc3RhdGUoYWRldiwgREZfQ1NUQVRFX0FMTE9XKTsKKwlzcGluX3VubG9ja19pcnFyZXN0
b3JlKCZhZGV2LT5wY2llX2lkeF9sb2NrLCBmbGFncyk7CiB9CiAKIC8qCkBAIC0xNzcsMTcgKzE1
MywxMiBAQCBzdGF0aWMgdm9pZCBkZl92M182X3BlcmZtb25fcnJlZyhzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwKIAlhZGRyZXNzID0gYWRldi0+bmJpby5mdW5jcy0+Z2V0X3BjaWVfaW5kZXhf
b2Zmc2V0KGFkZXYpOwogCWRhdGEgPSBhZGV2LT5uYmlvLmZ1bmNzLT5nZXRfcGNpZV9kYXRhX29m
ZnNldChhZGV2KTsKIAotCWlmIChkZl92M182X3NldF9kZl9jc3RhdGUoYWRldiwgREZfQ1NUQVRF
X0RJU0FMTE9XKSkKLQkJcmV0dXJuOwotCiAJc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPnBjaWVf
aWR4X2xvY2ssIGZsYWdzKTsKIAlXUkVHMzIoYWRkcmVzcywgbG9fYWRkcik7CiAJKmxvX3ZhbCA9
IFJSRUczMihkYXRhKTsKIAlXUkVHMzIoYWRkcmVzcywgaGlfYWRkcik7CiAJKmhpX3ZhbCA9IFJS
RUczMihkYXRhKTsKIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2LT5wY2llX2lkeF9sb2Nr
LCBmbGFncyk7Ci0KLQlkZl92M182X3NldF9kZl9jc3RhdGUoYWRldiwgREZfQ1NUQVRFX0FMTE9X
KTsKIH0KIAogLyoKQEAgLTIwNCwxNyArMTc1LDEyIEBAIHN0YXRpYyB2b2lkIGRmX3YzXzZfcGVy
Zm1vbl93cmVnKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50MzJfdCBsb19hZGRyLAog
CWFkZHJlc3MgPSBhZGV2LT5uYmlvLmZ1bmNzLT5nZXRfcGNpZV9pbmRleF9vZmZzZXQoYWRldik7
CiAJZGF0YSA9IGFkZXYtPm5iaW8uZnVuY3MtPmdldF9wY2llX2RhdGFfb2Zmc2V0KGFkZXYpOwog
Ci0JaWYgKGRmX3YzXzZfc2V0X2RmX2NzdGF0ZShhZGV2LCBERl9DU1RBVEVfRElTQUxMT1cpKQot
CQlyZXR1cm47Ci0KIAlzcGluX2xvY2tfaXJxc2F2ZSgmYWRldi0+cGNpZV9pZHhfbG9jaywgZmxh
Z3MpOwogCVdSRUczMihhZGRyZXNzLCBsb19hZGRyKTsKIAlXUkVHMzIoZGF0YSwgbG9fdmFsKTsK
IAlXUkVHMzIoYWRkcmVzcywgaGlfYWRkcik7CiAJV1JFRzMyKGRhdGEsIGhpX3ZhbCk7CiAJc3Bp
bl91bmxvY2tfaXJxcmVzdG9yZSgmYWRldi0+cGNpZV9pZHhfbG9jaywgZmxhZ3MpOwotCi0JZGZf
djNfNl9zZXRfZGZfY3N0YXRlKGFkZXYsIERGX0NTVEFURV9BTExPVyk7CiB9CiAKIC8qIGdldCB0
aGUgbnVtYmVyIG9mIGRmIGNvdW50ZXJzIGF2YWlsYWJsZSAqLwpAQCAtNTQ2LDcgKzUxMiw3IEBA
IHN0YXRpYyB2b2lkIGRmX3YzXzZfcG1jX2dldF9jb3VudChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwKIAkJCQkgIHVpbnQ2NF90IGNvbmZpZywKIAkJCQkgIHVpbnQ2NF90ICpjb3VudCkKIHsK
LQl1aW50MzJfdCBsb19iYXNlX2FkZHIsIGhpX2Jhc2VfYWRkciwgbG9fdmFsID0gMCwgaGlfdmFs
ID0gMDsKKwl1aW50MzJfdCBsb19iYXNlX2FkZHIsIGhpX2Jhc2VfYWRkciwgbG9fdmFsLCBoaV92
YWw7CiAJKmNvdW50ID0gMDsKIAogCXN3aXRjaCAoYWRldi0+YXNpY190eXBlKSB7Ci0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
