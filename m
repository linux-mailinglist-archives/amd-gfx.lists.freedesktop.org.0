Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6AC85AFC
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 08:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387986E2F6;
	Thu,  8 Aug 2019 06:44:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750048.outbound.protection.outlook.com [40.107.75.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A325C6E2F6
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 06:44:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOjWvv1ylEr2hWf1fkG9O2onv+/Cye9PdngkOfXoXcQrdLEvb6dsx3HJaRzEL+OT03/PebeyDA0urG/sjooy1STwZmI/UBTrrVeAbVcaxakqc+yst9iIRfRtpztQ/ROol/NHRAFein6qYhOUSnSqIpwamtJ+hX5nXeXyjEY/mthPvdcJr/DVLEvZyYJWwDRX+C34W2VvYF2O0WqB7qso8LsW89Zu97eGugGSRQl4zUI3LTn8M5B5w6q1fCX2OTI4rTZU86Mtcy9Pp8A4ckf9720RhBQiNX8islMa9/8JSbomIxxGzO5/TQeRrtCwTTJ++ch8hjZrmSB/a4MKQ4fSQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxjVQcs60IRJuXC171QzZ0Dv6inwvrdW7DElCPg8SGc=;
 b=F7GabP0k1x7sI46y3wJNAl8sJIOXVebeFH08UKWmY1PuWgJ0FmRyTKiamasPO8t6bWHxH0fe0WQQSnrGduGrJ1WVWrmjArtaxqkQLFtPkELgQyNcpVvtgwQrTOMoLyGxwXWi+tfUgZoH9DufbhDkxwx+2XtVaTSpQP1wLbtygP3k0C32ySLCyQn6py+Xacmjzd8Zac0sOhhw52f5KH3I3DVMALdgiY5GQwuXeUafGdllQxZc3hgwD4IeqcoAAOihpIHPsTCxTs2CMIr8h1HQ6iKYZrPoZx+lcO2M4ObEZM39D+K+hmWoS7AiijPIyzKwhYDGk3tOIR1ksVx2mV7d7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1498.namprd12.prod.outlook.com (10.172.39.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.20; Thu, 8 Aug 2019 06:44:16 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e%3]) with mapi id 15.20.2136.018; Thu, 8 Aug 2019
 06:44:16 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amd/powerplay: update smu11_driver_if_navi10.h
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: update smu11_driver_if_navi10.h
Thread-Index: AQHVTa0J5tCv9JrV3E6b+5MX176UxabwzezA
Date: Thu, 8 Aug 2019 06:44:16 +0000
Message-ID: <DM5PR12MB1418CBD425F639C429DFED25FCD70@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <1565243343-7561-1-git-send-email-tianci.yin@amd.com>
 <1565243343-7561-2-git-send-email-tianci.yin@amd.com>
In-Reply-To: <1565243343-7561-2-git-send-email-tianci.yin@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50b8a813-8ac3-4b3d-eaca-08d71bcbd4fd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1498; 
x-ms-traffictypediagnostic: DM5PR12MB1498:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB14982FCA490FE44ADB67BCF1FCD70@DM5PR12MB1498.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(13464003)(189003)(199004)(110136005)(316002)(186003)(54906003)(52536014)(486006)(476003)(99286004)(446003)(5660300002)(11346002)(25786009)(3846002)(6116002)(76116006)(2906002)(66446008)(64756008)(66556008)(66476007)(26005)(66946007)(2501003)(71200400001)(478600001)(14444005)(256004)(71190400001)(966005)(6436002)(53936002)(6306002)(55016002)(14454004)(6246003)(9686003)(102836004)(53546011)(7696005)(76176011)(33656002)(6506007)(229853002)(8676002)(81166006)(86362001)(8936002)(66066001)(81156014)(15650500001)(74316002)(305945005)(4326008)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1498;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: J2e491qDVSXfRxXsTflUDiBMLQh5g2tErFE5U20W3juXpeh187ii8og+n/fi+bxmOHhlH3+KDmop68HfdYZZG+qhbeakAC58EME8yjtOhXb6CBbmRrwhlZtatFoZ2ASOK3YpLZu5WRThM86IOLCIA8HeY8ffgltxNwUKDVatvvReEzvD1anMef0/n5SZX3/Ackytoo8F5Fg09KehgI8lBEchdHgacUaCFjrMyZbeNW+thKOw+VgAMfOTZS1Q/TY6WB86KMcFyP4k3iQ+7LpDqBdQ7FT1xFLWo3DyfXRJI286fWCajM166FtRTT1YrinI3zB/o2dYIy2cuq3TNZ7SvN46vFUZyJeJTEXr4P8uYzXugMN5U6ohJMvmro3zoMPE75XUOKM4s9g+RiEjh/QLcC+dhc1FA3hN9MV/UMJyMGs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b8a813-8ac3-4b3d-eaca-08d71bcbd4fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 06:44:16.0886 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hawzhang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1498
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxjVQcs60IRJuXC171QzZ0Dv6inwvrdW7DElCPg8SGc=;
 b=W97vOkRy58trDif3eLlwgXwNvVvTDMdjfYZnhpfCYjH5wTQWTMR0V3qyv1iCxG5xBWDlgtzSUIDuluVfzIIEARx8YfZ6R48kHpbUTptVr1CYBEch0YTQbBbGpjo9/NZV9vxAgRLrEXpNKlkF4A5J5hzjvvvGosyKlnlX/Ciu1dA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Quan, 
 Evan" <Evan.Quan@amd.com>, "Yin, Tianci \(Rico\)" <Tianci.Yin@amd.com>, "Yuan,
 Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2VyaWVzIGlzIFJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5j
b20+DQoNClJlZ2FyZHMsDQpIYXdraW5nDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJv
bTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVo
YWxmIE9mIFRpYW5jaSBZaW4NClNlbnQ6IDIwMTnlubQ45pyIOOaXpSAxMzo0OQ0KVG86IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogWGlhbywgSmFjayA8SmFjay5YaWFvQGFtZC5j
b20+OyBXYW5nLCBLZXZpbihZYW5nKSA8S2V2aW4xLldhbmdAYW1kLmNvbT47IFlpbiwgVGlhbmNp
IChSaWNvKSA8VGlhbmNpLllpbkBhbWQuY29tPjsgWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhh
bmdAYW1kLmNvbT47IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPjsgWXVhbiwgWGlhb2pp
ZSA8WGlhb2ppZS5ZdWFuQGFtZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggMi8yXSBkcm0vYW1kL3Bv
d2VycGxheTogdXBkYXRlIHNtdTExX2RyaXZlcl9pZl9uYXZpMTAuaA0KDQpGcm9tOiB0aWFuY3lp
biA8dGlhbmNpLnlpbkBhbWQuY29tPg0KDQp1cGRhdGUgdGhlIHNtdTExX2RyaXZlcl9pZl9uYXZp
MTAuaCBzaW5jZSBuYXZpMTQgc211IGZ3IHVwZGF0ZSB0byA1My4xMg0KDQpDaGFuZ2UtSWQ6IElm
MGY3MjllYzg3Yzk4ZjI0ZTE3OTRmMDg0N2VhYzViYTIzNjcxZTM0DQpSZXZpZXdlZC1ieTogRXZh
biBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4NClNpZ25lZC1vZmYtYnk6IHRpYW5jeWluIDx0aWFu
Y2kueWluQGFtZC5jb20+DQotLS0NCiAuLi4vZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdTExX2Ry
aXZlcl9pZl9uYXZpMTAuaCB8IDI1ICsrKysrKysrKysrKysrKysrLS0tLS0NCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211X3YxMV8wLmggICAgICB8ICAyICstDQogMiBmaWxl
cyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdTExX2RyaXZlcl9pZl9uYXZp
MTAuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXUxMV9kcml2ZXJfaWZf
bmF2aTEwLmgNCmluZGV4IDZkOWU3OWUuLmFjMDEyMGUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211MTFfZHJpdmVyX2lmX25hdmkxMC5oDQorKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211MTFfZHJpdmVyX2lmX25hdmkxMC5o
DQpAQCAtNTA2LDEwICs1MDYsMTEgQEAgdHlwZWRlZiBzdHJ1Y3Qgew0KICAgdWludDMyX3QgU3Rh
dHVzOw0KIA0KICAgdWludDE2X3QgRGllVGVtcGVyYXR1cmU7DQotICB1aW50MTZfdCBNZW1vcnlU
ZW1wZXJhdHVyZTsNCisgIHVpbnQxNl90IEN1cnJlbnRNZW1vcnlUZW1wZXJhdHVyZTsNCiANCi0g
IHVpbnQxNl90IFNlbGVjdGVkQ2FyZFBvd2VyOw0KLSAgdWludDE2X3QgUmVzZXJ2ZWQ0OyANCisg
IHVpbnQxNl90IE1lbW9yeVRlbXBlcmF0dXJlOw0KKyAgdWludDhfdCBNZW1vcnlIb3RzcG90UG9z
aXRpb247DQorICB1aW50OF90IFJlc2VydmVkNDsNCiANCiAgIHVpbnQzMl90IEJvYXJkTGV2ZWxF
bmVyZ3lBY2N1bXVsYXRvcjsgIH0gT3V0T2ZCYW5kTW9uaXRvcl90OyBAQCAtODAxLDcgKzgwMiwx
MiBAQCB0eXBlZGVmIHN0cnVjdCB7DQogICAvLyBNdmRkIFN2aTIgRGl2IFJhdGlvIFNldHRpbmcN
CiAgIHVpbnQzMl90ICAgICBNdmRkUmF0aW87IC8vIFRoaXMgaXMgdXNlZCBmb3IgTVZERCBWaWQg
d29ya2Fyb3VuZC4gSXQgaGFzIDE2IGZyYWN0aW9uYWwgYml0cyAoUTE2LjE2KQ0KIA0KLSAgdWlu
dDMyX3QgICAgIEJvYXJkUmVzZXJ2ZWRbOV07DQorICB1aW50OF90ICAgICAgUmVuZXNlc0xvYWRM
aW5lRW5hYmxlZDsNCisgIHVpbnQ4X3QgICAgICBHZnhMb2FkbGluZVJlc2lzdGFuY2U7DQorICB1
aW50OF90ICAgICAgU29jTG9hZGxpbmVSZXNpc3RhbmNlOw0KKyAgdWludDhfdCAgICAgIFBhZGRp
bmc4X0xvYWRsaW5lOw0KKw0KKyAgdWludDMyX3QgICAgIEJvYXJkUmVzZXJ2ZWRbOF07DQogDQog
ICAvLyBQYWRkaW5nIGZvciBNTUhVQiAtIGRvIG5vdCBtb2RpZnkgdGhpcw0KICAgdWludDMyX3Qg
ICAgIE1tSHViUGFkZGluZ1s4XTsgLy8gU01VIGludGVybmFsIHVzZQ0KQEAgLTkwNSwxMyArOTEx
LDIyIEBAIHR5cGVkZWYgc3RydWN0IHsNCiB9IFdhdGVybWFya3NfdDsNCiANCiB0eXBlZGVmIHN0
cnVjdCB7DQorICB1aW50MTZfdCBhdmdQc21Db3VudFsyOF07DQorICB1aW50MTZfdCBtaW5Qc21D
b3VudFsyOF07DQorICBmbG9hdCAgICBhdmdQc21Wb2x0YWdlWzI4XTsNCisgIGZsb2F0ICAgIG1p
blBzbVZvbHRhZ2VbMjhdOw0KKw0KKyAgdWludDMyX3QgICAgIE1tSHViUGFkZGluZ1szMl07IC8v
IFNNVSBpbnRlcm5hbCB1c2UNCit9IEF2ZnNEZWJ1Z1RhYmxlX3RfTlYxNDsNCisNCit0eXBlZGVm
IHN0cnVjdCB7DQogICB1aW50MTZfdCBhdmdQc21Db3VudFszNl07DQogICB1aW50MTZfdCBtaW5Q
c21Db3VudFszNl07DQogICBmbG9hdCAgICBhdmdQc21Wb2x0YWdlWzM2XTsgDQogICBmbG9hdCAg
ICBtaW5Qc21Wb2x0YWdlWzM2XTsNCiANCiAgIHVpbnQzMl90ICAgICBNbUh1YlBhZGRpbmdbOF07
IC8vIFNNVSBpbnRlcm5hbCB1c2UNCi19IEF2ZnNEZWJ1Z1RhYmxlX3Q7DQorfSBBdmZzRGVidWdU
YWJsZV90X05WMTA7DQogDQogdHlwZWRlZiBzdHJ1Y3Qgew0KICAgdWludDhfdCAgQXZmc1ZlcnNp
b247DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92
MTFfMC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTFfMC5oDQpp
bmRleCA5NzYwNWU5Li5lZTg1NDJkIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvaW5jL3NtdV92MTFfMC5oDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9pbmMvc211X3YxMV8wLmgNCkBAIC0yOCw3ICsyOCw3IEBADQogI2RlZmluZSBTTVUxMV9E
UklWRVJfSUZfVkVSU0lPTl9JTlYgMHhGRkZGRkZGRiAgI2RlZmluZSBTTVUxMV9EUklWRVJfSUZf
VkVSU0lPTl9WRzIwIDB4MTMgICNkZWZpbmUgU01VMTFfRFJJVkVSX0lGX1ZFUlNJT05fTlYxMCAw
eDMzIC0jZGVmaW5lIFNNVTExX0RSSVZFUl9JRl9WRVJTSU9OX05WMTQgMHgzMw0KKyNkZWZpbmUg
U01VMTFfRFJJVkVSX0lGX1ZFUlNJT05fTlYxNCAweDM0DQogDQogLyogTVAgQXBlcnR1cmVzICov
DQogI2RlZmluZSBNUDBfUHVibGljCQkJMHgwMzgwMDAwMA0KLS0NCjIuNy40DQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcg
bGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
