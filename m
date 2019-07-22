Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5910A6F878
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jul 2019 06:28:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA74189AB3;
	Mon, 22 Jul 2019 04:28:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780079.outbound.protection.outlook.com [40.107.78.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B81089AB3
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 04:28:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eoW3YoD4eDRxpppzPgs0ucw8gcSQtE6aOOaWs3nKEgKNJ9UKZsIoznjVQWhqLZa+VSgAvh0v7gRmX+wp9O6KGUqA8jFiOAOKrSbVRnY87GL5USzfW6cHDOk0YhXFAqlr/wHR8Cur7R302dHHeF1OMXOaqv4kP+myPbkIlgPJKRO/Q7LtquQ2WOssaWZP7FRl0xkWKzvcdF4FilbVCEIpsDqySnIAtDuki136D8i2YIxrWXVSuQCzrXPGvNAsBS9NlEOJ/igCvx3SnekRNjdJ0nCYX999f00RGk+ZqCGonuhp7p5GHm4VpZrjbTPptG9+o1OSqkOiVtOYdSAG9HjAEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0vcfSgOGwHVXx15n/4rZhEjr9UX1c21dTe5HW/P/64=;
 b=PySHXiho8RIVt1VpCbpiJTKTAZAJr/z4YjFm0iDeYmCi5xz6BhUnnMpOncJWTVqRlmW4tXJ8MO5sbln8u4dUknF/xVMNL4aF7NJSDYvlJKPtBTykFTmH6ozbVrAIlPUZPBpPZ5Gl2E7eGAGDRsZyku113ycu9VaUkw4Arlcl2UBotUw+Il1BaX3qGTSemAchmA5uxuxsJ8OrZSBF8ltn/GSAAWdtnXu/UlAnvitrjo0GAZS6u1I+cgmHq3DcCYJQpyEp/JhSfTsvGEXjSEarIWWoPn2TsE5pQ5Ng3yC11mSQw2joLAVfyFsm44PEPVXTqf7zV8cD0o/mc6NKIdwqcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB4016.namprd12.prod.outlook.com (10.255.239.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 04:28:02 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5%7]) with mapi id 15.20.2094.013; Mon, 22 Jul 2019
 04:28:02 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 3/5] drm/amd/powerplay: support VCN powergate status
 retrieval for SW SMU
Thread-Topic: [PATCH 3/5] drm/amd/powerplay: support VCN powergate status
 retrieval for SW SMU
Thread-Index: AQHVQDvQ+Dbaj3IxS0CBlwngIyvgMKbWCyfQ
Date: Mon, 22 Jul 2019 04:28:02 +0000
Message-ID: <MN2PR12MB3598DDCA8379EF41A4EEDC768EC40@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <20190722031531.23437-1-evan.quan@amd.com>
 <20190722031531.23437-4-evan.quan@amd.com>
In-Reply-To: <20190722031531.23437-4-evan.quan@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97e8da7a-3eaf-4041-117a-08d70e5cfbe3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4016; 
x-ms-traffictypediagnostic: MN2PR12MB4016:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB4016650AA2E3F4638CA249458EC40@MN2PR12MB4016.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:386;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39850400004)(136003)(396003)(346002)(376002)(13464003)(199004)(189003)(186003)(8936002)(5660300002)(7736002)(66066001)(6246003)(2906002)(81166006)(81156014)(8676002)(53546011)(476003)(26005)(102836004)(446003)(11346002)(33656002)(55016002)(66446008)(64756008)(256004)(6506007)(99286004)(9686003)(6306002)(53936002)(966005)(76116006)(66556008)(66476007)(229853002)(52536014)(66946007)(3846002)(6436002)(110136005)(6116002)(86362001)(478600001)(316002)(76176011)(486006)(305945005)(7696005)(14454004)(68736007)(74316002)(4326008)(25786009)(71200400001)(71190400001)(54906003)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4016;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UrimpLPijkIyWeNcnmCVb0Fp9UeHcxz76x+0dOHI0QZ7sfb4IViaJnb4MZtaAJbHIDnypZRZUUSAH/C4oWkBmN7bkD7SSlr23VDc69EKqgwdmojXW6GdfTE1OzUo0AeGgHvOXikS+lQHGNdBJ/RwPjomHSeXZgb1rEinQLk0S6cLGjbq6EebdHyH6XeFz/L1imz1JYn4N1xAcWz9n/Wgo7FkcUSj2vfH+EzmkUj3ujk+1tmbGOifkV3fbXfYZkJt7/syBf6xi8EOhePDd0eDdnfeRQuGdX2SQmOXFDl2QeSlyCHdqAPEGqFQ35iyDHQfZtRr+XhoEiLgCsNS4hu616THjFJTcJgi2J/KHKfgJv4n1txZBrbhyW508TJeIyRCjSBUlDl2okvnxur0u5TiBYmMhffAVZJ65SHfBl0JfE8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e8da7a-3eaf-4041-117a-08d70e5cfbe3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 04:28:02.1287 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qyfeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4016
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0vcfSgOGwHVXx15n/4rZhEjr9UX1c21dTe5HW/P/64=;
 b=M476UWsn70UYxmM0nfxClZV5HJj1kPRXJnYUwBpKfMqr5VWxjFrJ8TrYUVQdNk6i8E2QE/gqTghjCCW+smWKLdMBCXo8KbL0uJQUnaZ/oG7Y3Z9WNsKXOWsdTg7ulYPZBxCiehjAxGVTybteAIrAKLIp/aep7HjvrYqk9buTS2Y=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kenneth.Feng@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+DQoNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggW21haWx0bzphbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnXSBPbiBCZWhhbGYgT2YgRXZhbiBRdWFuDQpTZW50
OiBNb25kYXksIEp1bHkgMjIsIDIwMTkgMTE6MTUgQU0NClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1k
LmNvbT47IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIIDMv
NV0gZHJtL2FtZC9wb3dlcnBsYXk6IHN1cHBvcnQgVkNOIHBvd2VyZ2F0ZSBzdGF0dXMgcmV0cmll
dmFsIGZvciBTVyBTTVUNCg0KW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQ0KDQpDb21tb25seSB1
c2VkIGZvciBWQ04gcG93ZXJnYXRlIHN0YXR1cyByZXRyaWV2YWwgZm9yIFNXIFNNVS4NCg0KQ2hh
bmdlLUlkOiBJYmMyZjQ5ODg0OGY3MjhlYjc3MjdjZDNmYTg4OWU5MWEyYjA5ZDA3Yg0KU2lnbmVk
LW9mZi1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyB8IDQgKysrKw0KIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2FtZGdwdV9zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdw
dV9zbXUuYw0KaW5kZXggNDE2ZjlhODM3ZmE4Li40ZTE4ZjMzYTFiYWIgMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMNCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYw0KQEAgLTMzNiw2ICszMzYsMTAgQEAg
aW50IHNtdV9jb21tb25fcmVhZF9zZW5zb3Ioc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVudW0g
YW1kX3BwX3NlbnNvcnMgc2Vuc29yLA0KICAgICAgICAgICAgICAgICoodWludDMyX3QgKilkYXRh
ID0gc211X2ZlYXR1cmVfaXNfZW5hYmxlZChzbXUsIFNNVV9GRUFUVVJFX0RQTV9WQ0VfQklUKSA/
IDEgOiAwOw0KICAgICAgICAgICAgICAgICpzaXplID0gNDsNCiAgICAgICAgICAgICAgICBicmVh
azsNCisgICAgICAgY2FzZSBBTURHUFVfUFBfU0VOU09SX1ZDTl9QT1dFUjoNCisgICAgICAgICAg
ICAgICAqKHVpbnQzMl90ICopZGF0YSA9IHNtdV9mZWF0dXJlX2lzX2VuYWJsZWQoc211LCBTTVVf
RkVBVFVSRV9WQ05fUEdfQklUKSA/IDEgOiAwOw0KKyAgICAgICAgICAgICAgICpzaXplID0gNDsN
CisgICAgICAgICAgICAgICBicmVhazsNCiAgICAgICAgZGVmYXVsdDoNCiAgICAgICAgICAgICAg
ICByZXQgPSAtRUlOVkFMOw0KICAgICAgICAgICAgICAgIGJyZWFrOw0KLS0NCjIuMjIuMA0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KYW1kLWdmeCBt
YWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
