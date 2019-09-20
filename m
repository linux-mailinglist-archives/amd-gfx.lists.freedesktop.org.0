Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D844B98A4
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Sep 2019 22:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76DA6EB59;
	Fri, 20 Sep 2019 20:49:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720087.outbound.protection.outlook.com [40.107.72.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765BC6EB59
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Sep 2019 20:49:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YxgEabz6LnbvPnRivNbg6atXtcuE93kkiMnoJCB6oc7pFgQPcyqltpFAz31YsvVZ1sngcD94VnDJwr4bdkbSfRbDyrMXL+Zm5rSjFOHGrjA4WOmvllWmOqnftEgwQ+tyrba759PIR8VElU21kFBcQ9G38gfjHDtoYKUcGK6kQdRDBX97IO+c1G9CoCKq3iCa/77R5KLEmqjuOZixTpLSPQ/OVhXwaZjf+8u/ep10URaOrngmF5bR25YLi0v1ufMk9P5xwX23YUipILledsmrkTIlNOKRn5q4BdhbfwZ9xo1j8kxeJrATOLMqUtYvmsfHtxht08VOC5IyXnBbJVSjDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHrRc99kr4D1wPFrftp3ckZDu/DWY66jFoVoIgxSowg=;
 b=Vcuh2ZVsxjEjiua7OUqGEuVKIw2eQPMLbwmePIti/t10gdc1w2equ4vAvKbrMtrrDzq4+ZdXE7ainRtIKvRA/evI2EEcPu/NZYsX4UfcYPkpmDnLNMDXnYgxqGF2L9G0QAcDK2vVZDS4VTTuGo+jzgg/+QHcEACPmy5J97X2Jh4pCT68nbI6aSGKJxfvJYRb9mVw0Exqx5RnUUs57TQjLg+ye30ZOCdn3qa8P/kRtQk9l6Y1/NpzWMuOuO2a5WfPJQiEByFVpSYOEunDzedtFfK8uwwMU7ZJb7nTRpucMb5xlyUFgx3ab9jze54Y2eZC4kUAArEs6S9NjY7fs3g3Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0117.namprd12.prod.outlook.com (10.174.53.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.13; Fri, 20 Sep 2019 20:49:39 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0%11]) with mapi id 15.20.2284.023; Fri, 20 Sep
 2019 20:49:39 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/display: fix 64 bit divide
Thread-Topic: [PATCH] drm/amdgpu/display: fix 64 bit divide
Thread-Index: AQHVb/CSqXu0yde4Pk2g5IkAZRZGp6c1CfCA
Date: Fri, 20 Sep 2019 20:49:38 +0000
Message-ID: <88248f99-ab74-ab77-633d-be79a81f4f82@amd.com>
References: <20190920201812.3763-1-alexander.deucher@amd.com>
In-Reply-To: <20190920201812.3763-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
x-clientproxiedby: YTXPR0101CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::44) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d366bc0e-a59b-4513-10a6-08d73e0c0dc1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0117; 
x-ms-traffictypediagnostic: CY4PR1201MB0117:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB01171C10334F25D66DE0BD8B8C880@CY4PR1201MB0117.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:334;
x-forefront-prvs: 0166B75B74
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(376002)(366004)(396003)(199004)(189003)(53546011)(31686004)(66556008)(478600001)(386003)(76176011)(7736002)(229853002)(6506007)(14454004)(52116002)(66476007)(31696002)(256004)(66066001)(14444005)(6436002)(3846002)(58126008)(36756003)(2906002)(65956001)(102836004)(316002)(6486002)(6116002)(110136005)(305945005)(99286004)(5660300002)(65806001)(476003)(71190400001)(25786009)(186003)(71200400001)(8936002)(81166006)(66946007)(486006)(81156014)(2501003)(66446008)(8676002)(2616005)(11346002)(26005)(6512007)(6246003)(4326008)(64756008)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0117;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Txshcimme57g6vjkVZkV9n7UTzw6/I82wzpkWapX1SUghxTy/1RVikHUctTp0E57Q4TNFJOFoc4zBuXLgMOgC0cXSiSPSXayPAqs2dkQbJfttG3GAnfDgYvvg32jcK+QNBVTtDR4tfVGVYuZMBLaV/No78Vke7COKb9IPqFGONiPtN91oAFeyxkMY6ezNp1zhjMbwyHUdjQTrbTvis7L59d3LO3gQJ8g8OmAoKUGA8qs2C51V3U0SgGC+m/FpHPaOanw42+Y9phEWjlcXnS4M5DUNFs4h6wdvqBzpKYsYPRZN+CIb5NR1ZM6GTInGxdKnBizvs8QE06wVy+ZMPHloqN7ac5VECKMwSlc7aOCSBq2frSpP5V+cRjsYJderXyEEVR7OgNLiqiDDV3ws0s/oeVBe9kZSAlpoBxH3Ip2/Wg=
Content-ID: <D82275D7D9EFCB4E8EA69E0EAECEDCE2@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d366bc0e-a59b-4513-10a6-08d73e0c0dc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2019 20:49:39.0679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 69USqJmelkcBlSabkNZ+1qNYC0EDbXAJHknpV8VRAaf8/WPOKAkkpRB3l1WZWAxKPzle8K79g7NEFAYNetiYMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0117
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHrRc99kr4D1wPFrftp3ckZDu/DWY66jFoVoIgxSowg=;
 b=kmW39+HBAmjsL+MlG5MsXLb3RPiOBUk2AfK5rUGLUcwsc+l8zEtDs6u70VGDciSE8juCG5q9dZfEs10selejlVw5pGsyeC3bFRdShsGGN6uD8Mx7Eeu7B+5sun8Dvg3s3CJ3MtBufbU25YMT33zYrh2UW0XBEorkLmlQWVjxzL4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNCk9uIDIwMTktMDktMjAgNDoxOCBwLm0uLCBBbGV4IERldWNoZXIgd3JvdGU6DQo+IFVzZSBw
cm9wZXIgaGVscGVyIGZvciAzMiBiaXQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQoNClJldmlld2VkLWJ5OiBIYXJyeSBXZW50
bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4NCg0KSGFycnkNCg0KPiAtLS0NCj4gIC4uLi9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNlMTEwL2RjZTExMF9jbGtfbWdyLmMgICAg
fCA0ICsrKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xr
X21nci9kY2UxMTAvZGNlMTEwX2Nsa19tZ3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9jbGtfbWdyL2RjZTExMC9kY2UxMTBfY2xrX21nci5jDQo+IGluZGV4IDM2Mjc3YmNhMDMy
Ni4uYjFlNjU3ZTEzN2E5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvY2xrX21nci9kY2UxMTAvZGNlMTEwX2Nsa19tZ3IuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9kY2UxMTAvZGNlMTEwX2Nsa19tZ3IuYw0KPiBA
QCAtMTk3LDcgKzE5Nyw5IEBAIHZvaWQgZGNlMTFfcHBsaWJfYXBwbHlfZGlzcGxheV9yZXF1aXJl
bWVudHMoDQo+ICAJICovDQo+ICAJaWYgKEFTSUNSRVZfSVNfVkVHQTIwX1AoZGMtPmN0eC0+YXNp
Y19pZC5od19pbnRlcm5hbF9yZXYpICYmIChjb250ZXh0LT5zdHJlYW1fY291bnQgPj0gMikpIHsN
Cj4gIAkJcHBfZGlzcGxheV9jZmctPm1pbl9tZW1vcnlfY2xvY2tfa2h6ID0gbWF4KHBwX2Rpc3Bs
YXlfY2ZnLT5taW5fbWVtb3J5X2Nsb2NrX2toeiwNCj4gLQkJCSh1aW50MzJfdCkgKGRjLT5id192
Ymlvcy0+aGlnaF95Y2xrLnZhbHVlIC8gbWVtb3J5X3R5cGVfbXVsdGlwbGllciAvIDEwMDAwKSk7
DQo+ICsJCQkJCQkJICAgKHVpbnQzMl90KSBkaXY2NF9zNjQoDQo+ICsJCQkJCQkJCSAgIGRpdjY0
X3M2NChkYy0+YndfdmJpb3MtPmhpZ2hfeWNsay52YWx1ZSwNCj4gKwkJCQkJCQkJCSAgICAgbWVt
b3J5X3R5cGVfbXVsdGlwbGllciksIDEwMDAwKSk7DQo+ICAJfSBlbHNlIHsNCj4gIAkJcHBfZGlz
cGxheV9jZmctPm1pbl9tZW1vcnlfY2xvY2tfa2h6ID0gY29udGV4dC0+YndfY3R4LmJ3LmRjZS55
Y2xrX2toeg0KPiAgCQkJLyBtZW1vcnlfdHlwZV9tdWx0aXBsaWVyOw0KPiANCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
