Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AFADCD31
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2019 19:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAF06EB83;
	Fri, 18 Oct 2019 17:59:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810053.outbound.protection.outlook.com [40.107.81.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C95B6EB83
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2019 17:59:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UfiXFFEylvCD1FLFipB3JarAcYvJneFbqt9ktFkmF52ouY94tuu2KYdeOHiqdtCnzEYzd/glQ6dQ4qJV4GfsFRCncy4025GJRXtr/CS7+AijSssuSG4zLaV9uTrDsvG4F4lZFzeyfxR857/Kq1l/vc7ORiLJTzsoDzgTLcX8J0MCy4uE96OjVKFiu2oX+NgiPMagZ2GOBnCwFpqn408fmXKhU3Svx+58PWbzEkS88ocazGGIIfiDe1IwsZYkng3pjh3s9uFBt+IDwoeWqdnWFb6OaOmlLAjyYipMTrrx/i9whp0qcSdZGO3v33pab0s2pMUdRYbxswDAY7I4Q5DSag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLyqZrdajaDrQiSP2XUSoHZcp5+G54Z9fgEH/4MR1BI=;
 b=AlkedGwVFmZUe623upg5HXFdlPcHKeIbRFAeZ9oBi4+SMQKpWyziIskNMRMXdUaiTThNqJY70qFQlZISciYslLjnIwpXc0l6U4Styn9L07Lo/d7dkIGoHn+1Ci2sCIC6Eqp/kK0NWMwAptP4sdrp9kvrrkdy097nneIeKEHlmgDu4JREGTkqv2OsfvkRYO1RWaPHlfn8c6tBuAxFxWwPYL6ZkTV+nC0vOgwK380lfujPbf6XL2UT8e8+JEjyjXN3kxV7J/BMB2rs8aFVIAKDUqdwl/OTBvFHkIOUXvatlrWDWRsm98VKIsIr6N0jMfhSdMUCyQmjyWoJPzcoOPn/ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB3831.namprd12.prod.outlook.com (52.132.245.141) by
 CH2PR12MB4279.namprd12.prod.outlook.com (20.180.16.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.22; Fri, 18 Oct 2019 17:59:44 +0000
Received: from CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::911:107a:8757:3994]) by CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::911:107a:8757:3994%3]) with mapi id 15.20.2367.019; Fri, 18 Oct 2019
 17:59:44 +0000
From: "Kim, Jonathan" <Jonathan.Kim@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] Revert "drm/amdgpu: disable c-states on xgmi perfmons"
Thread-Topic: [PATCH 2/2] Revert "drm/amdgpu: disable c-states on xgmi
 perfmons"
Thread-Index: AQHVhd3SaQnMRjo1zk+hD/31Khw4Ng==
Date: Fri, 18 Oct 2019 17:59:44 +0000
Message-ID: <20191018175928.25307-2-jonathan.kim@amd.com>
References: <20191018175928.25307-1-jonathan.kim@amd.com>
In-Reply-To: <20191018175928.25307-1-jonathan.kim@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::17)
 To CH2PR12MB3831.namprd12.prod.outlook.com
 (2603:10b6:610:29::13)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4da2b7e8-5e67-4e2b-8959-08d753f4f4bb
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CH2PR12MB4279:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB4279265D976C7A6997B44098856C0@CH2PR12MB4279.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:336;
x-forefront-prvs: 01949FE337
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(396003)(136003)(346002)(39860400002)(189003)(199004)(66946007)(2351001)(8936002)(81156014)(316002)(54906003)(478600001)(50226002)(14454004)(71200400001)(71190400001)(81166006)(486006)(256004)(476003)(305945005)(14444005)(66446008)(66556008)(7736002)(64756008)(2501003)(2616005)(446003)(11346002)(66476007)(52116002)(6506007)(5660300002)(76176011)(3846002)(26005)(6512007)(186003)(86362001)(2906002)(6916009)(6116002)(36756003)(6436002)(6486002)(4326008)(25786009)(66066001)(102836004)(1076003)(386003)(99286004)(8676002)(5640700003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4279;
 H:CH2PR12MB3831.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3U3pF2lxVila1/iRI3lTPdDUhkPQtVQ9X+D5XOxUTwRtOLHzCt+NECA/ow44+XiDZsosUTtuI/CFLWCvio+mXuVik5mGcOeMZKW6dlVHG91rM0bb+XrZYeQatRQbHW6HRa9GqXmIxcAsjn3JIbQEVYYW5m4Xrknqd9fT0MOVpqeEaf5yGRAdVOmXDvBbsFd7Kl5XSHBgYuyTJTxImtqSCwswCAFK72Oh57r6hSHNTeyCQXBWWHbLY/jcyRM1z7PlugwzgtjWknuKOVxYaMMx+ipt9LDLwzrLjqk2h8V1JclKZZS/7Q9EXc52skPP2ciV17BdH8weJmvaGHrjLxvKyWUcIIvh+Vs59eVdA4OMZ8MbdrN97T3gD1YHlHkDeqOfk/dfRD254c/JuKzWpYThS4VyLxMCpiDLBjNxYl1I9PM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da2b7e8-5e67-4e2b-8959-08d753f4f4bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2019 17:59:44.1200 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cURuDjUGAA0LDBN0XkUXYAoABXfhgL1/clutvj+zMY0xUw1anqAMtlhYpepwsJdi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4279
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLyqZrdajaDrQiSP2XUSoHZcp5+G54Z9fgEH/4MR1BI=;
 b=y8VUFfVLcPEE3NSxop9UvtnkAeZA2CYdAzYCUGdiBMGI/jengpG7jBHrTWwMAERvOcWv+225X+qG0fWTGUF7GTr2d9ZUZAPstxoKotp5WZg5fpI5p+McrJKlfOCGTXNW3nANhKTBKhn1nxzqa0lMz1eGR9mDmxsh/L+bonR07BA=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Kim, Jonathan" <Jonathan.Kim@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyByZXZlcnRzIGNvbW1pdCA1NDI3NWNkMTY0OWY0MDM0YzY0NTBiNmM1YTgzNThmY2Q0Zjdk
ZGE2LgoKaW5jb21wbGV0ZSBzb2x1dGlvbiB0byBkZiBjLXN0YXRlIHJhY2UgY29uZGl0aW9uLiAg
c211IG1zZyBpbiBwZXJmIGV2ZW50cwpjYXVzZXMgZGVhZGxvY2suCgpDaGFuZ2UtSWQ6IElhODUx
NzlkZjJiZDE2NzY1N2U0MmEyZDgyOGM0YTdjNDc1YzM5MmZmClNpZ25lZC1vZmYtYnk6IEpvbmF0
aGFuIEtpbSA8Sm9uYXRoYW4uS2ltQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZGZfdjNfNi5jIHwgMzYgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9kZl92M182LmMKaW5kZXggZjQwM2M2MmM5NDRlLi4xNmZiZDJiYzhhZDEgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMKQEAgLTkzLDIxICs5Myw2IEBAIGNvbnN0IHN0
cnVjdCBhdHRyaWJ1dGVfZ3JvdXAgKmRmX3YzXzZfYXR0cl9ncm91cHNbXSA9IHsKIAkJTlVMTAog
fTsKIAotc3RhdGljIGRmX3YzXzZfc2V0X2RmX2NzdGF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwgaW50IGFsbG93KQotewotCWludCByID0gMDsKLQotCWlmIChpc19zdXBwb3J0X3N3X3Nt
dShhZGV2KSkgewotCQlyID0gc211X3NldF9kZl9jc3RhdGUoJmFkZXYtPnNtdSwgYWxsb3cpOwot
CX0gZWxzZSBpZiAoYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzCi0JCQkmJiBhZGV2LT5wb3dlcnBs
YXkucHBfZnVuY3MtPnNldF9kZl9jc3RhdGUpIHsKLQkJciA9IGFkZXYtPnBvd2VycGxheS5wcF9m
dW5jcy0+c2V0X2RmX2NzdGF0ZSgKLQkJCWFkZXYtPnBvd2VycGxheS5wcF9oYW5kbGUsIGFsbG93
KTsKLQl9Ci0KLQlyZXR1cm4gcjsKLX0KLQogc3RhdGljIHVpbnQ2NF90IGRmX3YzXzZfZ2V0X2Zp
Y2Eoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCQkJIHVpbnQzMl90IGZpY2FhX3ZhbCkK
IHsKQEAgLTExNyw5ICsxMDIsNiBAQCBzdGF0aWMgdWludDY0X3QgZGZfdjNfNl9nZXRfZmljYShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAlhZGRyZXNzID0gYWRldi0+bmJpby5mdW5jcy0+
Z2V0X3BjaWVfaW5kZXhfb2Zmc2V0KGFkZXYpOwogCWRhdGEgPSBhZGV2LT5uYmlvLmZ1bmNzLT5n
ZXRfcGNpZV9kYXRhX29mZnNldChhZGV2KTsKIAotCWlmIChkZl92M182X3NldF9kZl9jc3RhdGUo
YWRldiwgREZfQ1NUQVRFX0RJU0FMTE9XKSkKLQkJcmV0dXJuIDB4RkZGRkZGRkZGRkZGRkZGRjsK
LQogCXNwaW5fbG9ja19pcnFzYXZlKCZhZGV2LT5wY2llX2lkeF9sb2NrLCBmbGFncyk7CiAJV1JF
RzMyKGFkZHJlc3MsIHNtbkRGX1BJRV9BT05fRmFicmljSW5kaXJlY3RDb25maWdBY2Nlc3NBZGRy
ZXNzMyk7CiAJV1JFRzMyKGRhdGEsIGZpY2FhX3ZhbCk7CkBAIC0xMzIsOCArMTE0LDYgQEAgc3Rh
dGljIHVpbnQ2NF90IGRmX3YzXzZfZ2V0X2ZpY2Eoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
CiAKIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2LT5wY2llX2lkeF9sb2NrLCBmbGFncyk7
CiAKLQlkZl92M182X3NldF9kZl9jc3RhdGUoYWRldiwgREZfQ1NUQVRFX0FMTE9XKTsKLQogCXJl
dHVybiAoKChmaWNhZGhfdmFsICYgMHhGRkZGRkZGRkZGRkZGRkZGKSA8PCAzMikgfCBmaWNhZGxf
dmFsKTsKIH0KIApAQCAtMTQ1LDkgKzEyNSw2IEBAIHN0YXRpYyB2b2lkIGRmX3YzXzZfc2V0X2Zp
Y2Eoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IGZpY2FhX3ZhbCwKIAlhZGRy
ZXNzID0gYWRldi0+bmJpby5mdW5jcy0+Z2V0X3BjaWVfaW5kZXhfb2Zmc2V0KGFkZXYpOwogCWRh
dGEgPSBhZGV2LT5uYmlvLmZ1bmNzLT5nZXRfcGNpZV9kYXRhX29mZnNldChhZGV2KTsKIAotCWlm
IChkZl92M182X3NldF9kZl9jc3RhdGUoYWRldiwgREZfQ1NUQVRFX0RJU0FMTE9XKSkKLQkJcmV0
dXJuOwotCiAJc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPnBjaWVfaWR4X2xvY2ssIGZsYWdzKTsK
IAlXUkVHMzIoYWRkcmVzcywgc21uREZfUElFX0FPTl9GYWJyaWNJbmRpcmVjdENvbmZpZ0FjY2Vz
c0FkZHJlc3MzKTsKIAlXUkVHMzIoZGF0YSwgZmljYWFfdmFsKTsKQEAgLTE1Nyw5ICsxMzQsOCBA
QCBzdGF0aWMgdm9pZCBkZl92M182X3NldF9maWNhKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LCB1aW50MzJfdCBmaWNhYV92YWwsCiAKIAlXUkVHMzIoYWRkcmVzcywgc21uREZfUElFX0FPTl9G
YWJyaWNJbmRpcmVjdENvbmZpZ0FjY2Vzc0RhdGFIaTMpOwogCVdSRUczMihkYXRhLCBmaWNhZGhf
dmFsKTsKLQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2LT5wY2llX2lkeF9sb2NrLCBmbGFn
cyk7CiAKLQlkZl92M182X3NldF9kZl9jc3RhdGUoYWRldiwgREZfQ1NUQVRFX0FMTE9XKTsKKwlz
cGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2LT5wY2llX2lkeF9sb2NrLCBmbGFncyk7CiB9CiAK
IC8qCkBAIC0xNzcsMTcgKzE1MywxMiBAQCBzdGF0aWMgdm9pZCBkZl92M182X3BlcmZtb25fcnJl
ZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAlhZGRyZXNzID0gYWRldi0+bmJpby5mdW5j
cy0+Z2V0X3BjaWVfaW5kZXhfb2Zmc2V0KGFkZXYpOwogCWRhdGEgPSBhZGV2LT5uYmlvLmZ1bmNz
LT5nZXRfcGNpZV9kYXRhX29mZnNldChhZGV2KTsKIAotCWlmIChkZl92M182X3NldF9kZl9jc3Rh
dGUoYWRldiwgREZfQ1NUQVRFX0RJU0FMTE9XKSkKLQkJcmV0dXJuOwotCiAJc3Bpbl9sb2NrX2ly
cXNhdmUoJmFkZXYtPnBjaWVfaWR4X2xvY2ssIGZsYWdzKTsKIAlXUkVHMzIoYWRkcmVzcywgbG9f
YWRkcik7CiAJKmxvX3ZhbCA9IFJSRUczMihkYXRhKTsKIAlXUkVHMzIoYWRkcmVzcywgaGlfYWRk
cik7CiAJKmhpX3ZhbCA9IFJSRUczMihkYXRhKTsKIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZh
ZGV2LT5wY2llX2lkeF9sb2NrLCBmbGFncyk7Ci0KLQlkZl92M182X3NldF9kZl9jc3RhdGUoYWRl
diwgREZfQ1NUQVRFX0FMTE9XKTsKIH0KIAogLyoKQEAgLTIwNCwxNyArMTc1LDEyIEBAIHN0YXRp
YyB2b2lkIGRmX3YzXzZfcGVyZm1vbl93cmVnKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1
aW50MzJfdCBsb19hZGRyLAogCWFkZHJlc3MgPSBhZGV2LT5uYmlvLmZ1bmNzLT5nZXRfcGNpZV9p
bmRleF9vZmZzZXQoYWRldik7CiAJZGF0YSA9IGFkZXYtPm5iaW8uZnVuY3MtPmdldF9wY2llX2Rh
dGFfb2Zmc2V0KGFkZXYpOwogCi0JaWYgKGRmX3YzXzZfc2V0X2RmX2NzdGF0ZShhZGV2LCBERl9D
U1RBVEVfRElTQUxMT1cpKQotCQlyZXR1cm47Ci0KIAlzcGluX2xvY2tfaXJxc2F2ZSgmYWRldi0+
cGNpZV9pZHhfbG9jaywgZmxhZ3MpOwogCVdSRUczMihhZGRyZXNzLCBsb19hZGRyKTsKIAlXUkVH
MzIoZGF0YSwgbG9fdmFsKTsKIAlXUkVHMzIoYWRkcmVzcywgaGlfYWRkcik7CiAJV1JFRzMyKGRh
dGEsIGhpX3ZhbCk7CiAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYWRldi0+cGNpZV9pZHhfbG9j
aywgZmxhZ3MpOwotCi0JZGZfdjNfNl9zZXRfZGZfY3N0YXRlKGFkZXYsIERGX0NTVEFURV9BTExP
Vyk7CiB9CiAKIC8qIGdldCB0aGUgbnVtYmVyIG9mIGRmIGNvdW50ZXJzIGF2YWlsYWJsZSAqLwot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
