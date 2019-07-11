Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 069CF6532B
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jul 2019 10:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6E66E15E;
	Thu, 11 Jul 2019 08:28:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800048.outbound.protection.outlook.com [40.107.80.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98566E15E
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Jul 2019 08:28:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=kIuUGDSAfjvovgRAMi9d74/xz9cD2P5UrbtFDUmVR21067sV9oMPBSnCNd34l3brGCsTBj2Yedm1YA3rDWazFbkw7ln8mf3lpECnS1a5cmq5C3vF/S7h7okyd/8WBZatwnr1D8lD/Ho0CgLW/0i7cf3F1TXvapP0vP5BWiHt5gg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQ8e/PG1PKRBPPuqHki9MJbJZJQSzVBO7U0VA9yBaCc=;
 b=SwhUChjymB3QcqkfttA6nQMqUcJTK1lpjbN5rdXXFQo4AxgyfK/xjpXOEFZXBqOcvglNi3M8XhdCLouy+GZ05LmQSfPwVvh0DLA1gHqh0TkfMgeZrZKacatAY1AkZ6AjLTatGT+Upbrz9vwMJmlTi8nW+ye0OHZlUWF7/T/gL3g=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from CH2PR12MB3767.namprd12.prod.outlook.com (52.132.244.213) by
 CH2PR12MB3878.namprd12.prod.outlook.com (52.132.246.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Thu, 11 Jul 2019 08:28:32 +0000
Received: from CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::6cc4:28bf:361f:d486]) by CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::6cc4:28bf:361f:d486%3]) with mapi id 15.20.2052.020; Thu, 11 Jul 2019
 08:28:32 +0000
From: "Xu, Feifei" <Feifei.Xu@amd.com>
To: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/discovery: fix DCE_HWIP mapping error in
 hw_id_map array
Thread-Topic: [PATCH] drm/amdgpu/discovery: fix DCE_HWIP mapping error in
 hw_id_map array
Thread-Index: AQHVN77MiooKFcro3k6cRY2y/7qsGqbFFa8Q
Date: Thu, 11 Jul 2019 08:28:32 +0000
Message-ID: <CH2PR12MB3767908A917424D54CDC6CDAFEF30@CH2PR12MB3767.namprd12.prod.outlook.com>
References: <1562832050-28203-1-git-send-email-tianci.yin@amd.com>
In-Reply-To: <1562832050-28203-1-git-send-email-tianci.yin@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b9c642a-07a0-45cd-8188-08d705d9c2b5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CH2PR12MB3878; 
x-ms-traffictypediagnostic: CH2PR12MB3878:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CH2PR12MB38782D27177EFA745464372EFEF30@CH2PR12MB3878.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(13464003)(189003)(199004)(229853002)(476003)(8676002)(256004)(6506007)(2906002)(54906003)(3846002)(305945005)(14444005)(6246003)(486006)(7696005)(6116002)(81166006)(4326008)(102836004)(76176011)(53546011)(25786009)(446003)(99286004)(110136005)(14454004)(66066001)(11346002)(186003)(316002)(52536014)(33656002)(966005)(64756008)(76116006)(66446008)(6436002)(9686003)(66946007)(66476007)(81156014)(71190400001)(8936002)(71200400001)(2501003)(86362001)(7736002)(53936002)(66556008)(68736007)(26005)(55016002)(478600001)(6306002)(5660300002)(74316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3878;
 H:CH2PR12MB3767.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ksjgZsp1K8CIgp5zV99HXXtZj9rcMZuSTqnw80l74e6ioPEji2qEdqjDAtgjGuW3ul7QcJomfkmf/DR3W8fpNs8vOrqojXtp16ayQQoxhkN/AEZ/rpyhvwQ01osaHv8nxLFpQY8KbG+dAz1ZRp98k2uPPuCzykbbGDuVi2HHJjf8hoynpImJQYvxZvb/aVU+LUx0EIj6swWCErsrviZRj4WG92dofSgYHtV6BLxOaXiZOrnYsfwdotMFx7bQ4T0vdQ9814/FWcxne65aI+kgu3UscIKiQW2orXo4a396x3ROeIjTrGAMfDivJTHl8Xqc0cjxOLq33cNHJavJuPYBxiv2P1M6QZKFS11lEQX4VNh9xchBm3/110k06P9XqszAirVEeAtxlWF9EK1iBq5twHElv9sqiLa+aUNABGoobBc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b9c642a-07a0-45cd-8188-08d705d9c2b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 08:28:32.6972 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: feifxu@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3878
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQ8e/PG1PKRBPPuqHki9MJbJZJQSzVBO7U0VA9yBaCc=;
 b=03xm8G+k3XhtGCN5rPSMEOmV81RUaSxYCoEaP29G7hCI3X0nr06S3meGYqDffauMJlTL8h6BCy++Tg9uyQEbdz6ZRjJAtaxBgDjNw+ClncuWwIW3qGTDYTbZxNUk/6hZNugtGrj6fnYqhbqTddbqPFgTKOBalSVo+vjTmMRa1vk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Feifei.Xu@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Yin,
 Tianci \(Rico\)" <Tianci.Yin@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>, "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEZlaWZlaSBYdSA8RmVpZmVpLlh1QGFtZC5jb20+DQoNClJlZ2FyZHMsDQpG
ZWlmZWkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggPGFtZC1n
ZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBUaWFuY2kgWWlu
DQpTZW50OiAyMDE55bm0N+aciDEx5pelIDE2OjAxDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCkNjOiBYaWFvLCBKYWNrIDxKYWNrLlhpYW9AYW1kLmNvbT47IFl1YW4sIFhpYW9q
aWUgPFhpYW9qaWUuWXVhbkBhbWQuY29tPjsgWWluLCBUaWFuY2kgKFJpY28pIDxUaWFuY2kuWWlu
QGFtZC5jb20+OyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KU3ViamVj
dDogW1BBVENIXSBkcm0vYW1kZ3B1L2Rpc2NvdmVyeTogZml4IERDRV9IV0lQIG1hcHBpbmcgZXJy
b3IgaW4gaHdfaWRfbWFwIGFycmF5DQoNCkZyb206IHRpYW5jeWluIDx0aWFuY2kueWluQGFtZC5j
b20+DQoNCklEIG9mIERDRV9IV0lQIGZyb20gdmJpb3MgaXMgRE1VX0hXSUQsDQptaXNtYXRjaCBj
YXVzZSBudWxsIHBvaW50ZXIgY3Jhc2ggaW4gbmF2aTEwIG1vZHByb2JlLg0KDQpDaGFuZ2UtSWQ6
IEkzYmUzNjNjZjUyNDhkZTkwNGIzYmRhZTJmMzRkM2JiZTBiYmJjMDdkDQpTaWduZWQtb2ZmLWJ5
OiB0aWFuY3lpbiA8dGlhbmNpLnlpbkBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5jIHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2Rpc2NvdmVyeS5jDQppbmRleCBlMDQ5YWU2Li4xNDgxODk5IDEwMDY0NA0KLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5jDQorKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzY292ZXJ5LmMNCkBAIC0xMjMsNyAr
MTIzLDcgQEAgc3RhdGljIGludCBod19pZF9tYXBbTUFYX0hXSVBdID0gew0KIAlbVVZEX0hXSVBd
CT0gVVZEX0hXSUQsDQogCVtWQ0VfSFdJUF0JPSBWQ0VfSFdJRCwNCiAJW0RGX0hXSVBdCT0gREZf
SFdJRCwNCi0JW0RDRV9IV0lQXQk9IERDRUFaX0hXSUQsDQorCVtEQ0VfSFdJUF0JPSBETVVfSFdJ
RCwNCiAJW09TU1NZU19IV0lQXQk9IE9TU1NZU19IV0lELA0KIAlbU01VSU9fSFdJUF0JPSBTTVVJ
T19IV0lELA0KIAlbUFdSX0hXSVBdCT0gUFdSX0hXSUQsDQotLSANCjIuNy40DQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcg
bGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
