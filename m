Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE08B34FF
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Sep 2019 09:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5246E110;
	Mon, 16 Sep 2019 07:01:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690082.outbound.protection.outlook.com [40.107.69.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97136891AF
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 07:01:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWhNQOshpHyhNmTKxLFkeVyjpKG/O2eVPtuCWh5hG96HGAQ3a5uXEf7zgO3i4ljlZelJJl83AntrW91xscwgTPoE4bfs0/lN0bjVALAgSHeC8RLPmoEZO5oYl4ro2HuzhtIbwu0zmIZPsq5aecT2EHWnEFVCnjjgSAeSvGMWrb9LkRrtOfJ21RarehFPvP4GUNriZbSYlukFJJpar8fDyJG5YNi71XY42CoXdc/KCrO5FA2eLz0rc+IeJNdq10E9sInwKzuN8YlgP98r4V8aMAvlsL9Ls5S/FMQvXWrJcP6kaxFeYQnBW7phN5psJZHjE0GpO4IRSF5ET2Isr5qdFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwklGMEr43sB6QHfIR8jstzWLRwl9wgN6zEtMMFrGLw=;
 b=oe47XfCMGGNf2kQpqL8Vmvn5kWPj5Qhn/PBmythlkYiZfGkvYNMuRmldXKo1LSmCPcrgVs2vCTNj4ioNt4o106bOVisgRxbw9ZeSHshP6AgZoM4zA122Nd8nlVafUwvIPbbyT0LrUebEvTtbswVVxcZmIFH8gebQYa04zOShMtwTGpQ5lxkwyPl/DyMB4iHEJscoNA/te3xXFGwi2SQGJYDDvibbChNiFyWXMbsusKfZ7KCBSFZ69ZX/akrrv9zXxs9Bzggw/ik6W6yK0/tcvaRbCfpNdWDkvil6dbyd/01mzX9Ri3paUMHRgSMUk0reNyH2tG6MhaxL1Y4Ef3N/oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3056.namprd12.prod.outlook.com (20.178.242.143) by
 MN2PR12MB3615.namprd12.prod.outlook.com (20.178.242.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.20; Mon, 16 Sep 2019 07:01:36 +0000
Received: from MN2PR12MB3056.namprd12.prod.outlook.com
 ([fe80::10e6:34bc:237d:3bd5]) by MN2PR12MB3056.namprd12.prod.outlook.com
 ([fe80::10e6:34bc:237d:3bd5%4]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 07:01:36 +0000
From: <jianzh@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/SRIOV: Navi12 SRIOV VF gets GTT base
Thread-Topic: [PATCH] drm/amdgpu/SRIOV: Navi12 SRIOV VF gets GTT base
Thread-Index: AQHVbFyU2TuJmjuV9kGcvDWvxshJhA==
Date: Mon, 16 Sep 2019 07:01:36 +0000
Message-ID: <20190916070114.9250-1-jianzh@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0095.apcprd03.prod.outlook.com
 (2603:1096:203:72::35) To MN2PR12MB3056.namprd12.prod.outlook.com
 (2603:10b6:208:ca::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70714841-8a2f-415a-73ab-08d73a73b6c6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3615; 
x-ms-traffictypediagnostic: MN2PR12MB3615:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB361575E0A3CB2C41FED5282AE18C0@MN2PR12MB3615.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(366004)(346002)(396003)(199004)(189003)(1076003)(2501003)(71200400001)(71190400001)(25786009)(486006)(4326008)(256004)(54906003)(6436002)(6486002)(5640700003)(6512007)(36756003)(66946007)(66446008)(64756008)(66556008)(66476007)(316002)(53936002)(81156014)(4744005)(2906002)(476003)(8676002)(2616005)(81166006)(6916009)(8936002)(52116002)(50226002)(66066001)(186003)(478600001)(305945005)(7736002)(3846002)(5660300002)(6506007)(26005)(102836004)(6116002)(2351001)(14454004)(99286004)(386003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3615;
 H:MN2PR12MB3056.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XmRLM8I5Luzk+LBkfoLMltZjrw35l+Kf/UGIqtV8CJMZM+y3rRCYMcATddu3Fxrr8P7NFRLFh+b18Tv8ZEKL/h6TzpxmTBGkoryYKqEMy8/AlkDoLpua5V9iu2Mh9/j38512vXznMezsr1cKCJCMs/uyrllutFxVGaYkccMy0ngkHulOpBpeC6q6jEPyEAvitpjxHt1x2k/Y5hbSGFVcZ9DTQUM2ZUZN8jy828OaPr9vIAKVRUGRG4Lk8l6MGfz2/ZqWIijYCyBHtTk1jtY5OELr41cWAxCJffq/NMFFOe0VUgtDPb/sHCS3XahddpD2Ttsmzy2V35X1ghUtdL5JdD9sEF/sZdwX5ZWcmw1tFU/62UJQdU5LF0/iI2CySz4MWsWn8d9OVPKELDDdJCWlcaC24C+g7v+6jl6ZE/YeGa4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70714841-8a2f-415a-73ab-08d73a73b6c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 07:01:36.4480 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wfse/Cl01fKtJui5yfH6Fv6kA5jieVN4EWHEPvyssc5BH5YTeW9JIbqIXzOSiAZR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3615
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwklGMEr43sB6QHfIR8jstzWLRwl9wgN6zEtMMFrGLw=;
 b=fOmAuO3Hi3SKw/2/0UBMo3LEfAq/4XPx1PpWcYrBQBLGU0Pi/myTBZt4PSB+OkgGpC5Upi7Y43YMTmFpeaX0i3vRF2kvEniYHACx3+mfVdkh6E8FJXto8tYSQI+dw4oa9+npP9PBMs0TZPgAu9pvs6ZbQdiiTwuLG2DB0vf3Qnc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jiange.Zhao@amd.com; 
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
Cc: "Deng, Emily" <Emily.Deng@amd.com>, "Zhao,
 Jiange" <Jiange.Zhao@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Nieto, David M" <David.Nieto@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmlhbmdlIFpoYW8gPEppYW5nZS5aaGFvQGFtZC5jb20+CgpXaXRoIGNoYW5nZXMgaW4g
UFNQIGFuZCBIViwgU1JJT1YgVkYgd2lsbCBoYW5kbGUKCnZyYW0gZ3R0IGxvY2F0aW9uIGp1c3Qg
bGlrZSBiYXJlIG1ldGFsLiBUaGVyZSBpcwoKbm8gbmVlZCB0byBkaWZmZXJlbnRpYXRlIGl0IGFu
eW1vcmUuCgpTaWduZWQtb2ZmLWJ5OiBKaWFuZ2UgWmhhbyA8SmlhbmdlLlpoYW9AYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYyB8IDMgKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nbWNfdjEwXzAuYwppbmRleCAxYThkOGY1MjhiMDEuLmVkMWMzYjg4M2Y2YSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMKQEAgLTUxOSw4ICs1MTksNyBA
QCBzdGF0aWMgdm9pZCBnbWNfdjEwXzBfdnJhbV9ndHRfbG9jYXRpb24oc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsCiB7CiAJdTY0IGJhc2UgPSAwOwogCi0JaWYgKCFhbWRncHVfc3Jpb3ZfdmYo
YWRldikpCi0JCWJhc2UgPSBnZnhodWJfdjJfMF9nZXRfZmJfbG9jYXRpb24oYWRldik7CisJYmFz
ZSA9IGdmeGh1Yl92Ml8wX2dldF9mYl9sb2NhdGlvbihhZGV2KTsKIAogCWFtZGdwdV9nbWNfdnJh
bV9sb2NhdGlvbihhZGV2LCAmYWRldi0+Z21jLCBiYXNlKTsKIAlhbWRncHVfZ21jX2dhcnRfbG9j
YXRpb24oYWRldiwgbWMpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
