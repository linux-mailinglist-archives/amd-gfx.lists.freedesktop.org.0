Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0AC6F873
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jul 2019 06:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598EA8999E;
	Mon, 22 Jul 2019 04:26:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780042.outbound.protection.outlook.com [40.107.78.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C2388999E
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 04:26:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZSjn+wHM/EtKPPb3nImQREhb9iaK513FRqNqMbE2BAd4eQVXyig1n0l1w/v9MScBtn4V+Y5JkoOkys583EoutoAtFTpGi2rLRtkvf8KJHQ0HqI9DMw5KSy/80t0nJkRQTAmvl82qKPylMUJCwduFGBDA7MQ1miF9kfDmDO3Mho8Gz/liV1WVvdQ5Ag+axwlkjBHu9Yz2m6GC1Mk7fxPsksZLx49MnukBpy8b98Kcg+YyCj6qPct04meWavsgf5pr2iEAvIHQy0zEaFK7WjM7jPBmPrrtcApcfFuMXCu5mqDJ7Xb1fMlCyhMLw3b8HJfvrI3rUyaxjeLpliMrojLvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJboFHVMKleNfpsWENg95a0Jl32cB2uMbidQkHuSWFY=;
 b=EUDUB0ChBav46d4X+lv5GAGzSLeufvAekoONghu2qkj273pNvKPcXlmc6YxijxnpIcwqx3En9pM4khNLaY2LUS3tXBFP1Vz88cZJQC09ahqcf/BWw94i0PtMxkOEPChgsy1Wo0jhMrNm2qKUfu5F1yed9SkYwSPYEjyVv17DwFHYeIk05RlBU+VRkAGztmn0S/pAz1OJUoP+mkX8Fs+Rs40UQHkrTC969/rONIvGMAyEtA7rwSeJhzYjN9Sr0pr2avQeq0vRTiVgU/QBIHMj1s/vF4FygXs7lfCEtYmr37d8PKntKOSVquQ5eyAzd/GAMCDQLDu0q0UkZUdDC80Vwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB4016.namprd12.prod.outlook.com (10.255.239.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 04:26:32 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5%7]) with mapi id 15.20.2094.013; Mon, 22 Jul 2019
 04:26:32 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/5] drm/amd/powerplay: add new sensor type for VCN
 powergate status
Thread-Topic: [PATCH 1/5] drm/amd/powerplay: add new sensor type for VCN
 powergate status
Thread-Index: AQHVQDvLxrOSXGTU/kapBDHCbPvEvqbWChxA
Date: Mon, 22 Jul 2019 04:26:31 +0000
Message-ID: <MN2PR12MB359851C9E6C7D57EE8E867188EC40@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <20190722031531.23437-1-evan.quan@amd.com>
 <20190722031531.23437-2-evan.quan@amd.com>
In-Reply-To: <20190722031531.23437-2-evan.quan@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b623ec48-dfa3-4fb8-7bc6-08d70e5cc627
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4016; 
x-ms-traffictypediagnostic: MN2PR12MB4016:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB40169BD17446B9BDDDDD53658EC40@MN2PR12MB4016.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(366004)(39850400004)(136003)(396003)(346002)(376002)(13464003)(199004)(189003)(186003)(8936002)(5660300002)(7736002)(66066001)(6246003)(2906002)(81166006)(81156014)(8676002)(53546011)(476003)(26005)(102836004)(446003)(11346002)(33656002)(55016002)(66446008)(64756008)(256004)(6506007)(99286004)(9686003)(6306002)(53936002)(966005)(76116006)(66556008)(66476007)(229853002)(52536014)(66946007)(3846002)(6436002)(110136005)(6116002)(86362001)(478600001)(316002)(76176011)(486006)(305945005)(7696005)(14454004)(68736007)(74316002)(4326008)(25786009)(71200400001)(71190400001)(54906003)(2501003)(61000200001)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4016;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ISjujbB7j64RbPwwXru+2Z5n+PwBA2IdttjD9Xs6y7I/ShFHlq3HCoAkxhtFqprXwmXsEy/4pUHD8YsSA4VqcDpz2wyGSjKUZFqbRiy98zHCNCBMJ+dwQMjyU314TZieN/ECZSpVIWujfiPhVC6NU/7IX7isGFZqvO6ssYKfU+cF/O9rrTXP3cNoCjEQTXFFRS6skkeZ8QjrWeaaguRhs/AK1aFbYvGdiODCtLj7A0hojdUCHBro842wdlMq/TNPN465SGgikAY2oYXKOBiWwDzBNS6xG/QpSYBKG8UmAHgRNTpEr//iYVOVAP/CtMOHcFKhlx0Ahck53CU84EdkKijGRDmPHqyra2MKxkDvbeeGhFH2F+/kwuhPFbJsE46IifWBLa2vWG1payw13U0KdBBLE9+eBbOE5H0Zzm/WeLY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b623ec48-dfa3-4fb8-7bc6-08d70e5cc627
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 04:26:31.8951 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qyfeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4016
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJboFHVMKleNfpsWENg95a0Jl32cB2uMbidQkHuSWFY=;
 b=z374yGBo8de4lD4WlLEm4T7Fzb2YaEgzpeJWcUHX/Wostd8FOjX9Qzc+mdahRPggvrdKdcBmO/Oc5tCEfI1GYz7rcFbr5Z/UljL73AoTSj8TzTXiAdvDhMHiwY98B+6jikZcgSmBqhpfqE0d5b6M713CU5kRwzImIdSEXilNcLk=
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

SSBqdXN0IHN1Z2dlc3QgdGhhdCB3ZSB1c2UgQU1ER1BVX1BQX1NFTlNPUl9WQ05fUE9XRVJfU1RB
VEUgaW5zdGVhZCBvZiBBTURHUFVfUFBfU0VOU09SX1ZDTl9QT1dFUiwNCnNpbmNlIHdlIGdldHMg
dGhlIHN0YXRlIG9mIHBvd2VyIG9uL29mZiwgbm90IHRoZSByZWFsIFZDTiBwb3dlciB2YWx1ZS4N
ClJldmlld2VkLWJ5OiBLZW5uZXRoIEZlbmcgPGtlbm5ldGguZmVuZ0BhbWQuY29tPg0KDQoNCg0K
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggW21haWx0bzphbWQtZ2Z4
LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnXSBPbiBCZWhhbGYgT2YgRXZhbiBRdWFuDQpT
ZW50OiBNb25kYXksIEp1bHkgMjIsIDIwMTkgMTE6MTUgQU0NClRvOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJA
YW1kLmNvbT47IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPg0KU3ViamVjdDogW1BBVENI
IDEvNV0gZHJtL2FtZC9wb3dlcnBsYXk6IGFkZCBuZXcgc2Vuc29yIHR5cGUgZm9yIFZDTiBwb3dl
cmdhdGUgc3RhdHVzDQoNCltDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0NCg0KVkNOIGlzIHdpZGVs
eSB1c2VkIGluIG5ldyBBU0lDcyBhbmQgZGlmZmVyZW50IGZyb20gdHJhbmRpdGlvbmFsIFVWRCBh
bmQgVkNFLg0KDQpDaGFuZ2UtSWQ6IEkzNWM5ZGI0MjA3MzQwMjllOGY4NDdkY2RjZTIzZGZmMTIw
NGQ3MGJjDQpTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPg0KLS0t
DQogZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2tnZF9wcF9pbnRlcmZhY2UuaCB8IDEgKw0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9pbmNsdWRlL2tnZF9wcF9pbnRlcmZhY2UuaCBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvaW5jbHVkZS9rZ2RfcHBfaW50ZXJmYWNlLmgNCmluZGV4IDk3MzNiYmY5YmM3Mi4uMTU3ZTg1
NDY4NTVkIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2tnZF9wcF9p
bnRlcmZhY2UuaA0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2tnZF9wcF9pbnRl
cmZhY2UuaA0KQEAgLTEyMyw2ICsxMjMsNyBAQCBlbnVtIGFtZF9wcF9zZW5zb3JzIHsNCiAgICAg
ICAgQU1ER1BVX1BQX1NFTlNPUl9FTkFCTEVEX1NNQ19GRUFUVVJFU19NQVNLLA0KICAgICAgICBB
TURHUFVfUFBfU0VOU09SX01JTl9GQU5fUlBNLA0KICAgICAgICBBTURHUFVfUFBfU0VOU09SX01B
WF9GQU5fUlBNLA0KKyAgICAgICBBTURHUFVfUFBfU0VOU09SX1ZDTl9QT1dFUiwNCiB9Ow0KDQog
ZW51bSBhbWRfcHBfdGFzayB7DQotLQ0KMi4yMi4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
