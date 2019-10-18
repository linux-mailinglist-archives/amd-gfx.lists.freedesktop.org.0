Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A132FDCCD0
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2019 19:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728C36E13F;
	Fri, 18 Oct 2019 17:30:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710085.outbound.protection.outlook.com [40.107.71.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D2B6E13F
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2019 17:30:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRN9Fi6uIM/MtZlhFzYtW9P3lZLfrYNijBtsxChVOJB6hQ+pL2jLwTZ1LH14mQihScdECVWHbZ/AEY0eH0pTjOA5nwRgRr9aeaHEgATE9uF85CUzhkQubCgNwOypInZ8vqsiAahiaOicz6ufYAk/xS11kYUZQe5iI5pBv0gp048sIGknDMwhgTJJB0DekrTEhUKcWrk/1+bBh8TE8TImKd5uc0MKopdRgWdR6p4GoUuauDRWKiWShy82LbDN9IT5RBQW71WIQreJoCKK1Moczhhm7rzAUklRgg/4+myhBgTN87xysWBnhC0InCnDu6eL0DgNF1n+CFCZaTTe1WqnbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJF3w49eOOgdXhMrclHTTM/WmglrHQNLq5S79vz3f3A=;
 b=bDK5MzrVdQy4RXJn89iEiULEJxAx3SCq5CyGwdjAPVS5P2rjwJtrb+qLQHtL8MW7D7W3fj6gaTzFW9//w/xcODC6C2WTjNpTsd7xp8C7oFhtnTLW4yyRhbqI4OipRZL8rivRiKvTeDpCJc9Vv3/8oJtbC1m7q3mBSPh5OasbLQeFDOwAc0gb1dMO8MInelgXk1SlYC+fRv/VLvgRl96+eRjcnig0TO8vz97kSkTulQhyTke4uaOdUu+G2xEZMTQg12gL2tZvvQDij4YwKuTTFKaJSwush85gRcbK5i1u7tCba/P+3aJyM8X/zrBhAeJEiPRO7ezcuT0/gwe8XmkO2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB3831.namprd12.prod.outlook.com (52.132.245.141) by
 CH2PR12MB4039.namprd12.prod.outlook.com (20.180.6.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.20; Fri, 18 Oct 2019 17:30:30 +0000
Received: from CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::911:107a:8757:3994]) by CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::911:107a:8757:3994%3]) with mapi id 15.20.2367.019; Fri, 18 Oct 2019
 17:30:30 +0000
From: "Kim, Jonathan" <Jonathan.Kim@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] Revert "drm/amdgpu: fix compiler warnings for df perfmons"
Thread-Topic: [PATCH 1/2] Revert "drm/amdgpu: fix compiler warnings for df
 perfmons"
Thread-Index: AQHVhdm9xyoBbl6ByUalsiWAYCIS6Q==
Date: Fri, 18 Oct 2019 17:30:30 +0000
Message-ID: <20191018172934.24716-1-jonathan.kim@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::42)
 To CH2PR12MB3831.namprd12.prod.outlook.com
 (2603:10b6:610:29::13)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b2d7399-d1db-4e95-873d-08d753f0df67
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CH2PR12MB4039:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB403935B09BCF960C92225AA1856C0@CH2PR12MB4039.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:59;
x-forefront-prvs: 01949FE337
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(189003)(199004)(81156014)(6512007)(66946007)(66446008)(64756008)(5660300002)(66476007)(66556008)(2906002)(478600001)(4744005)(5640700003)(6436002)(6916009)(4326008)(25786009)(305945005)(7736002)(81166006)(50226002)(8936002)(2351001)(8676002)(26005)(256004)(1076003)(71200400001)(52116002)(99286004)(71190400001)(186003)(2501003)(102836004)(316002)(86362001)(14454004)(6506007)(386003)(54906003)(6486002)(3846002)(486006)(66066001)(36756003)(6116002)(2616005)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4039;
 H:CH2PR12MB3831.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QZ66YZScULIqX9enMYoxlMnA/xPDsajg8Zll9YVXfKA7Ke/0dTdcxv9584GJsZpTIgS3i1nT8+rF/+Tcz0iYuiQpxJGJ5i0DFC3X5/gyqzDHtPEEH8uR/pkN/X/lmB/zL8LjspS1HuNv8RJ232U8DH0zg199n6QOb3b/rC/OMeRjeyI1MBpln7581Pv7m1gLWpYXKpkJTdn77FGdGJxRW6wgwNsyDKKSThzlbyqf50loMrZtjFTWId8Bp0CfRLqyGC0xdC2FdTWcIVLKYTMatCayax8lo1zD8BKoEQIU69Z0fQnPdjFx79cQIgl6QiLL/GPToKM/iywlw0rjW3EngFkb7hLXSFsQPdsvIDSgxXEWTq9+PlBz29MiTWwkERq3CwueIQGP3YHIl9CIVz7yYmdRqeLMimGx6vwoTt0niMqT7dHlczj3s8Kn5oa720pq
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b2d7399-d1db-4e95-873d-08d753f0df67
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2019 17:30:30.4193 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yf0scKlpqacaBq4OMJdMsjLUq+elucsp5fotawZCBbGEjHECWOEv5/RZtUeUp75K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4039
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJF3w49eOOgdXhMrclHTTM/WmglrHQNLq5S79vz3f3A=;
 b=R+tctHpHDy3Ahc+n8kLUsHvec4bWMzz/AvUEwDXOAXyACX4GeFp64Q7ZEJTGqaTpK0Te8DMDG0c/6d6opxBty3YwbOgL6f7WSoJIgUF+snm4CkU+xc+6btFVdxrN/L/aeCenSf8EkiK5hy8uEsVaBvE2Qpq3eodXXRcavG8cDp4=
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

VGhpcyByZXZlcnRzIGNvbW1pdCA3ZGQyZWIzMWZjZDU2NDU3NGU4ZWZlYTZiZjIzY2Y1MDRmOWUy
ZmQ3LgoKU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gS2ltIDxKb25hdGhhbi5LaW1AYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMgfCA0ICsrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZGZfdjNfNi5jCmluZGV4IGUxY2Y3ZTljNjE2YS4uZjQwM2M2MmM5NDRlIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jCkBAIC05Myw3ICs5Myw3IEBAIGNvbnN0IHN0
cnVjdCBhdHRyaWJ1dGVfZ3JvdXAgKmRmX3YzXzZfYXR0cl9ncm91cHNbXSA9IHsKIAkJTlVMTAog
fTsKIAotc3RhdGljIGludCBkZl92M182X3NldF9kZl9jc3RhdGUoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsIGludCBhbGxvdykKK3N0YXRpYyBkZl92M182X3NldF9kZl9jc3RhdGUoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGludCBhbGxvdykKIHsKIAlpbnQgciA9IDA7CiAKQEAgLTU0
Niw3ICs1NDYsNyBAQCBzdGF0aWMgdm9pZCBkZl92M182X3BtY19nZXRfY291bnQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsCiAJCQkJICB1aW50NjRfdCBjb25maWcsCiAJCQkJICB1aW50NjRf
dCAqY291bnQpCiB7Ci0JdWludDMyX3QgbG9fYmFzZV9hZGRyLCBoaV9iYXNlX2FkZHIsIGxvX3Zh
bCA9IDAsIGhpX3ZhbCA9IDA7CisJdWludDMyX3QgbG9fYmFzZV9hZGRyLCBoaV9iYXNlX2FkZHIs
IGxvX3ZhbCwgaGlfdmFsOwogCSpjb3VudCA9IDA7CiAKIAlzd2l0Y2ggKGFkZXYtPmFzaWNfdHlw
ZSkgewotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
