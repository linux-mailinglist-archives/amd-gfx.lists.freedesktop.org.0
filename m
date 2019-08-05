Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F04418120F
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Aug 2019 08:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0778089FEA;
	Mon,  5 Aug 2019 06:02:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2A289FEA
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Aug 2019 06:02:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eG0+WYSlnlAoEMGgkn8+JclG5FpM45AmkcYLPxOpkPGLJvfqokXT6YiijiADT3PSeEyrJmtzb2cWfgkiLvipYQcSdhGYrsfie904ZlB8zCtOhaXq18pbx244Js+cv1YWMXRfHqzvczWZKyHStc/dyF8cD7tvMCw/EN8TsSip24PpBGKB8tIAwI+nW923RCIU0eHXHbHaWTEvZJp8K0/QmN2vpIr2jyjju2AFjqk06eD0CruoZZBK/F71e6UenlcpxC2AGSPeMG8Wpk5P/ytfi1UxlDdX91iYTpUd5voTuhwGiighrUCB0kPSBAFJEAnSyN6KEkm16rfOXEk4b+fipQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XkrpTWSLMLQVSnby088kCIZ595ueAiPicAGIchIO954=;
 b=Ox29b8rD+rdeJQuAYK8zmYPUwB7mCX/9l1aPGs+O8DTuc9zeslzCQ3XalxkiKpAykomea2BDP1znT3xMEZgrWhTdsWl88tmbZKu00VA8un6HxOa5CgIcJbflvov869VNnk82OrkVcMh5N7usr+sDw/nt8Q7s7jBW4KqOCHgYMLxEa03WWWHog9CFdsqf0mXOsOcc/uZZOjr7y4klX0y/LwoS2cX5JAk8iiWug2GqIuHHnOYTD5M5or+dfyg0vdt7/nN0Kf62LinHXOWVXG3mtK0QHXul/vn9igjxh8n6+txrjsYKENLcG+T9EhYySekqX7WwaQF6e6Sz7TEKrPoisw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from SN6PR12MB2800.namprd12.prod.outlook.com (52.135.107.150) by
 SN6PR12MB2782.namprd12.prod.outlook.com (52.135.107.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 06:02:45 +0000
Received: from SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::accd:7f0e:8a0e:d10a]) by SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::accd:7f0e:8a0e:d10a%7]) with mapi id 15.20.2115.017; Mon, 5 Aug 2019
 06:02:45 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Do gpu reset if we lost some gpu reset requests
Thread-Topic: [PATCH] drm/amdgpu: Do gpu reset if we lost some gpu reset
 requests
Thread-Index: AdVLU1B4lySKF6XQSeqswDdT0DkxOA==
Date: Mon, 5 Aug 2019 06:02:45 +0000
Message-ID: <SN6PR12MB2800A083F4DB990AF2EEBD2B87DA0@SN6PR12MB2800.namprd12.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f8a7087b-caeb-4322-b9f3-08d7196a8936
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:SN6PR12MB2782; 
x-ms-traffictypediagnostic: SN6PR12MB2782:
x-microsoft-antispam-prvs: <SN6PR12MB278253E427BF478DD10B8FB487DA0@SN6PR12MB2782.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(189003)(199004)(71190400001)(6916009)(81156014)(8676002)(316002)(81166006)(14444005)(2906002)(256004)(54906003)(8936002)(53936002)(7736002)(305945005)(71200400001)(102836004)(64756008)(26005)(68736007)(4326008)(55016002)(5640700003)(9686003)(86362001)(6436002)(33656002)(476003)(186003)(99286004)(6506007)(7696005)(25786009)(74316002)(66066001)(3846002)(6116002)(2501003)(5660300002)(66946007)(66556008)(2351001)(14454004)(76116006)(66446008)(52536014)(486006)(66476007)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2782;
 H:SN6PR12MB2800.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mYymy3w9tZrz4m9btrUo9MZ5aLq39Fe95+n4zXhyp+SyVsj+MbjTmdHT1RBVMGe2vY5s6osH88nc5mkpzp+pJfVkEAYBe1oy0WkTTYjyMied7gWlqy8hgNfX8SF2q3cXfd2WuGaYpolMcQld8YxZ3w6Eq/6D9H3zhvs4KBUPIEixK2xcD5PHnBNRO3iofPFbREAFGfXrnp5/pmczuyQ1g5vyKAvRLwI8XxDUXJAzR2ZKbh/dPI+b1kFBLv6smGqGM3C2tXhiErr5lqDZ8ucIPlwCCFgKLHyZhhuawNxF1j8AmEU/h4FU1k1vk8j4gxfvAtJDup6XuHplHgkNIlvho3iHSxT1ddAdMFVoNPtfa6sdwCJt2UruQxIo7ybU6fY1lcuSfZidjlkdAX8+KmpCug9ZREJi6+NIO7wqXowVaFQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8a7087b-caeb-4322-b9f3-08d7196a8936
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 06:02:45.4188 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xpan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2782
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XkrpTWSLMLQVSnby088kCIZ595ueAiPicAGIchIO954=;
 b=wvQTewRgwOpXSHAKhlFoi36nLkRpdee/Wd2ZCphYj4JaMJaYBgrhHQMGrn7M2Lcdhsnh2m63EjML8R/ECQ5TValFIYvxE/aRjPxJtPQnIb6pyiOWHVIuQLWEshpKasvG7/5bSYfqoW/Y+hSW+XcnB59Ik9nLpT8jbQmtU5eQ4rs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xinhui.Pan@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Grodzovsky,
 Andrey" <Andrey.Grodzovsky@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

CkFzIHRoZSByYWNlIG9mIGdwdSByZXNldCB3aXRoIHJhcyBpbnRlcnJ1cHRzLiB3ZSBtaWdodCBs
b3NlIGEgY2hhbmNlIHRvCmRvIGdwdSByZWNvdmVyeS4gVG8gZ3VhcmFudGVlIHRoZSBncHUgaGFz
IHJlY292ZXJlZCBzdWNjZXNzZnVsbHksIHdlIHVzZQphdG9taWMgdG8gc2F2ZSB0aGUgY291bnRz
IG9mIGdwdSByZXNldCByZXF1ZXN0cywgYW5kIGlzc3VlIGFub3RoZXIgZ3B1CnJlc2V0IGlmIHRo
ZXJlIGFyZSBhbnkgcGVuZGluZyByZXF1ZXN0cy4KClNpZ25lZC1vZmYtYnk6IHhpbmh1aSBwYW4g
PHhpbmh1aS5wYW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmFzLmMgfCAxMCArKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmFzLmggfCAgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwppbmRleCBh
OTZiMGYxN2M2MTkuLmMxZjQ0NGI3NGIxOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9yYXMuYwpAQCAtMTIyMCw3ICsxMjIwLDE1IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9yYXNf
ZG9fcmVjb3Zlcnkoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQogCQljb250YWluZXJfb2Yod29y
aywgc3RydWN0IGFtZGdwdV9yYXMsIHJlY292ZXJ5X3dvcmspOwogCiAJYW1kZ3B1X2RldmljZV9n
cHVfcmVjb3ZlcihyYXMtPmFkZXYsIDApOwotCWF0b21pY19zZXQoJnJhcy0+aW5fcmVjb3Zlcnks
IDApOworCS8qIGlmIHRoZXJlIGlzIG5vIGNvbXBldGl0b24sIGluX3JlY292ZXJ5IGNoYW5nZXMg
ZnJvbSAxIHRvIDAuCisJICogaWYgcmFzX3Jlc2V0X2dwdSBpcyBjYWxsZWQgd2hpbGUgd2UgYXJl
IGRvaW5nIGdwdSByZWN2b2VyeSwKKwkgKiBiYWNhdXNlIG9mIHRoZSBhdG9taWMgcHJvdGVjdGlv
biwgd2UgbWF5IGxvc2Ugc29tZSByZWNvdmVyeQorCSAqIHJlcXVlc3RzLgorCSAqIFNvIHdlIHVz
ZSBhdG9taWNfeGNoZyB0byBjaGVjayB0aGUgY291bnQgb2YgcmVxdWVzdHMsIGFuZAorCSAqIGlz
c3VlIGFub3RoZXIgZ3B1IHJlc2V0IHJlcXVlc3QgdG8gcGVyZm9ybSB0aGUgZ3B1IHJlY292ZXJ5
LgorCSAqLworCWlmIChhdG9taWNfeGNoZygmcmFzLT5pbl9yZWNvdmVyeSwgMCkgPiAxKQorCQlh
bWRncHVfcmFzX3Jlc2V0X2dwdShyYXMtPmFkZXYsIDApOwogfQogCiBzdGF0aWMgaW50IGFtZGdw
dV9yYXNfcmVsZWFzZV92cmFtKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LApkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oCmluZGV4IDI3NjVmMmRiYjFlNi4uYmE0MjNhNGEz
MDEzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oCkBAIC00OTgsNyAr
NDk4LDcgQEAgc3RhdGljIGlubGluZSBpbnQgYW1kZ3B1X3Jhc19yZXNldF9ncHUoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsCiB7CiAJc3RydWN0IGFtZGdwdV9yYXMgKnJhcyA9IGFtZGdwdV9y
YXNfZ2V0X2NvbnRleHQoYWRldik7CiAKLQlpZiAoYXRvbWljX2NtcHhjaGcoJnJhcy0+aW5fcmVj
b3ZlcnksIDAsIDEpID09IDApCisJaWYgKGF0b21pY19pbmNfcmV0dXJuKCZyYXMtPmluX3JlY292
ZXJ5KSA9PSAxKQogCQlzY2hlZHVsZV93b3JrKCZyYXMtPnJlY292ZXJ5X3dvcmspOwogCXJldHVy
biAwOwogfQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
