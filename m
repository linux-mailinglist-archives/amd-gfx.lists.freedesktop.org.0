Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE81BBC067
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2019 04:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC9D89D9B;
	Tue, 24 Sep 2019 02:50:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780088.outbound.protection.outlook.com [40.107.78.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9973389D9B
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 02:50:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DuAizFGTDP2a+SvIeKY6wQrLvZ+tGT6VvyfXFRsuzw9TeGjiriBkUssgdTbP3tFFIaa8zBPpbkS8c9i/R1epvcv2tmOazbwFHm2hTbf255PY1eiRBFQgG/D5nL7HeA/si6vzWYoQAu9uk9HVP+e5ZhNTGb1SszM9mGc9JzQI1rzTPxfDuqsERmq42vVmt+4mDJukykd9LDS3DwoMzHI+h4k7EGMfJL41KzbywIJOy5QERLdmzGBWVDMvV6/GLQcc4+nWdKGghvjAI1xpZBw3MNJf85j5qMDS1V167wn8CUketMq5K9x81fEQ65RcaFA0Xprol3PWAiWAbhWYi5B/yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E831PcjliN4NmWBSr3ql6FaK3Z/CnkXogpLRUeC1fAo=;
 b=CZiU5EAExKxGgaNf3StWNKmbejWSQDU0aKO5j21cdG+fu2nqXhEY5naANQcHq0sWXtmLm4u9M5DtwoyOxpUMJoV41GxCyZdoD5iVXsap8WsHxvoPEQiEmsAVGj+05h4i1uQ5eweCXaZrs+9zM6AZAAdmpMC9pnBTvfV0DlkHn4QvsZkfxb+RoxZwylUfdG6Vn3RNrPG0PcAmhtL4EwEqm6rD0s4h+dPc7PvFJcrfBFKNR6qWqqxEWPnvdm448YYtohCQ1PKok8D33G6GS3H0WYsG7q7PDyxm20iCy05CfERFjMZ8TNOINQtkOxfEcHoMs60I5ZTBZlyt/7Drxhz6zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3008.namprd12.prod.outlook.com (20.178.242.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Tue, 24 Sep 2019 02:50:37 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed%6]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 02:50:37 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 5/5] drm/amd/powerplay: implement interface
 set_power_profile_mode()
Thread-Topic: [PATCH 5/5] drm/amd/powerplay: implement interface
 set_power_profile_mode()
Thread-Index: AQHVcerywOJbpmcMgE6UGfYN8wJo46c6IPiw
Date: Tue, 24 Sep 2019 02:50:36 +0000
Message-ID: <MN2PR12MB3344FCA9723E5A9CA4E6441CE4840@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1569228167-3120-1-git-send-email-Prike.Liang@amd.com>
 <1569228167-3120-5-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1569228167-3120-5-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1862ae0-3baf-43b3-d935-08d74099fa6d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3008; 
x-ms-traffictypediagnostic: MN2PR12MB3008:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB30088CFE5C9E31FEB52AE032E4840@MN2PR12MB3008.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(13464003)(189003)(199004)(305945005)(5660300002)(4326008)(33656002)(229853002)(7736002)(2501003)(66556008)(52536014)(64756008)(81156014)(8676002)(66446008)(76116006)(478600001)(6436002)(54906003)(66946007)(316002)(9686003)(74316002)(81166006)(8936002)(6246003)(55016002)(11346002)(14454004)(186003)(26005)(71200400001)(486006)(102836004)(66476007)(71190400001)(86362001)(99286004)(25786009)(110136005)(446003)(476003)(7696005)(53546011)(256004)(66066001)(6506007)(14444005)(3846002)(6116002)(76176011)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3008;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NVvfjl8Dk+w/2/rXYATcVqMDZEv/eHKs3tclzYbYYuYibh2MB8lT7e/egdxaermhxOIgHIsJR8ADcdECvQVLA+mfrJj0qzuHr2JW3yTpo/UxygD+/MYcq7tToKs+4/QI7lJDTpwMC1cAUj169doy+M9E8+VSoXinrNw+vqUvXNabiF3mo9hnBNA5l/A7IPka1fwHmqD6l2zD4Ex3Y8b5giQIr83gsmP3T9ZtyYohN0k2c72YFcohG7f0tG/ueyC9IuH0jMXa8ndkBEqx7FADSEkruQpSCck9d80aeAe1gvubSfksnx3fWhZ1dlLAdsGM2I0TsALM0zKmlVuqmR5+LMIw/HNC1+KcFl1yvueRcowKbQDMB7EiHFbNT7heeBlr93GYO2kxlKfnCK0/XHxh3zM5qQZ6jVj/jMX/CEiCGHk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1862ae0-3baf-43b3-d935-08d74099fa6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 02:50:36.9662 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e3OP16QpdF334Uy3U38Y9qDIXh2h7tAMPBr8CosgS8XUF5t/6+Pmy/smRnDWNXdj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3008
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E831PcjliN4NmWBSr3ql6FaK3Z/CnkXogpLRUeC1fAo=;
 b=tkAb+4wXTgKPnZo29G86nxRs7629a6UI+nmPVGj+f0xZ7YA35wPXxBA1YC6cym384wqXa1qrgh2pebVJRztmHBJ0t6DW05nyytkt592etQDehxKf5NPskoKZO2UMP82n3sZzqyYhVx0+rHJRqxseO8zf+jIz7iHqYEZzGnPf/Rk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "arron.liu@amd.com" <arron.liu@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

CgotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpGcm9tOiBMaWFuZywgUHJpa2UgPFByaWtlLkxp
YW5nQGFtZC5jb20+IApTZW50OiBNb25kYXksIFNlcHRlbWJlciAyMywgMjAxOSA0OjQzIFBNClRv
OiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogUXVhbiwgRXZhbiA8RXZhbi5RdWFu
QGFtZC5jb20+OyBGZW5nLCBLZW5uZXRoIDxLZW5uZXRoLkZlbmdAYW1kLmNvbT47IEh1YW5nLCBS
YXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgYXJyb24ubGl1QGFtZC5jb207IExpYW5nLCBQcmlrZSA8
UHJpa2UuTGlhbmdAYW1kLmNvbT4KU3ViamVjdDogW1BBVENIIDUvNV0gZHJtL2FtZC9wb3dlcnBs
YXk6IGltcGxlbWVudCBpbnRlcmZhY2Ugc2V0X3Bvd2VyX3Byb2ZpbGVfbW9kZSgpCgpBZGQgc2V0
X3Bvd2VyX3Byb2ZpbGVfbW9kZSgpIGZvciBub25lIG1hbnVhbCBkcG0gbGV2ZWwgY2FzZSBzZXR0
aW5nIHBvd2VyIHByb2ZpbGUgbW9kZS4KClNpZ25lZC1vZmYtYnk6IFByaWtlIExpYW5nIDxQcmlr
ZS5MaWFuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9p
cl9wcHQuYyB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAy
NSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvcmVub2lyX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3Bw
dC5jCmluZGV4IGM2YWFlMWMuLjY4MTk1MTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9yZW5vaXJfcHB0LmMKQEAgLTQ3Myw2ICs0NzMsMzAgQEAgc3RhdGljIGludCByZW5vaXJf
Zm9yY2VfY2xrX2xldmVscyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAlyZXR1cm4gcmV0Owog
fQogCitzdGF0aWMgaW50IHJlbm9pcl9zZXRfcG93ZXJfcHJvZmlsZV9tb2RlKHN0cnVjdCBzbXVf
Y29udGV4dCAqc211LCBsb25nIAorKmlucHV0LCB1aW50MzJfdCBzaXplKSB7CisJaW50IHdvcmts
b2FkX3R5cGU7CisKKwlzbXUtPnBvd2VyX3Byb2ZpbGVfbW9kZSA9IGlucHV0W3NpemVdOworCltR
dWFuLCBFdmFuXSB1cGRhdGUgY3VycmVudCBwb3dlciBwcm9maWxlIG1vZGUgb25seSB3aGVuIHNl
dHRpbmdzIGlzIHRyaWdnZXJlZCBzdWNjZXNzZnVsbHkuIFRoYXQgaXMgdG8gbW92ZSB0aGlzIGVu
ZCBvZiB0aGlzIGZ1bmN0aW9uIGNhbGwuCisJaWYgKHNtdS0+cG93ZXJfcHJvZmlsZV9tb2RlID4g
UFBfU01DX1BPV0VSX1BST0ZJTEVfQ1VTVE9NKSB7CisJCXByX2VycigiSW52YWxpZCBwb3dlciBw
cm9maWxlIG1vZGUgJWRcbiIsIHNtdS0+cG93ZXJfcHJvZmlsZV9tb2RlKTsKKwkJcmV0dXJuIC1F
SU5WQUw7CisJfQorCisJaWYgKHNtdS0+cG93ZXJfcHJvZmlsZV9tb2RlID09IFBQX1NNQ19QT1dF
Ul9QUk9GSUxFX0NVU1RPTSkgeworCQlpZiAoc2l6ZSA8IDApCisJCQlyZXR1cm4gLUVJTlZBTDsK
W1F1YW4sIEV2YW5dIFRoaXMgc2hvdWxkIG5vdCBiZSBmb3IgIiBQUF9TTUNfUE9XRVJfUFJPRklM
RV9DVVNUT00iIG9ubHkuIEFuZCAic2l6ZSIgY2hlY2sgc2VlbXMgdW5uZWNlc3NhcnkuCisKKwkv
KiBjb252IFBQX1NNQ19QT1dFUl9QUk9GSUxFKiB0byBXT1JLTE9BRF9QUExJQl8qX0JJVCAqLwor
CXdvcmtsb2FkX3R5cGUgPSBzbXVfd29ya2xvYWRfZ2V0X3R5cGUoc211LCBzbXUtPnBvd2VyX3By
b2ZpbGVfbW9kZSk7CisJc211X3NlbmRfc21jX21zZ193aXRoX3BhcmFtKHNtdSwgU01VX01TR19T
ZXRXb3JrbG9hZE1hc2ssCisJCQkJICAgIDEgPDwgd29ya2xvYWRfdHlwZSk7CisJfQorCXJldHVy
biAwOworfQorCisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyByZW5vaXJfcHB0
X2Z1bmNzID0gewogCS5nZXRfc211X21zZ19pbmRleCA9IHJlbm9pcl9nZXRfc211X21zZ19pbmRl
eCwKIAkuZ2V0X3NtdV90YWJsZV9pbmRleCA9IHJlbm9pcl9nZXRfc211X3RhYmxlX2luZGV4LCBA
QCAtNDg3LDYgKzUxMSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyByZW5v
aXJfcHB0X2Z1bmNzID0gewogCS5nZXRfd29ya2xvYWRfdHlwZSA9IHJlbm9pcl9nZXRfd29ya2xv
YWRfdHlwZSwKIAkuZ2V0X3Byb2ZpbGluZ19jbGtfbWFzayA9IHJlbm9pcl9nZXRfcHJvZmlsaW5n
X2Nsa19tYXNrLAogCS5mb3JjZV9jbGtfbGV2ZWxzID0gcmVub2lyX2ZvcmNlX2Nsa19sZXZlbHMs
CisJLnNldF9wb3dlcl9wcm9maWxlX21vZGUgPSByZW5vaXJfc2V0X3Bvd2VyX3Byb2ZpbGVfbW9k
ZSwKIH07CiAKIHZvaWQgcmVub2lyX3NldF9wcHRfZnVuY3Moc3RydWN0IHNtdV9jb250ZXh0ICpz
bXUpCi0tCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
