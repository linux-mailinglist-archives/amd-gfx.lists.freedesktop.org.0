Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19517B71C3
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 05:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCAD6F9C0;
	Thu, 19 Sep 2019 03:04:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820049.outbound.protection.outlook.com [40.107.82.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D1906F9C0
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 03:04:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBC6sm41TXYJkwTpPsWj/+tGBxV1G3smrQSPRECCIodQMtJevWx/FObeLfKvMtFWeaSLgBd813OznjRINXXIIfseCwDJzozFnibCP0cklzJqzC7mLNAqV6b5+VhBg50JWroP5BVUM6D0aN+ddr4iKBBum0W4CKNPuMICdhW/vgE9JVuimD1WGnItRvlxBrnxM8YB3XXuLb15aCj8hdFgKmI/1lHA7i+E9++KRFOQCBA16pMIoacVpoy3V+Vw35Q5vzik/vCXZJDktIKztW3+1r3Ze8z1Pgg2UlpobzRBB8EIiLo7xT0IFfFhm4qaFu3M5cqBqXH+lCvlXD58wkWXiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wZZgAe105MO1Je2U71+FjACRSnpgMtjf4N8o5WDeyw=;
 b=RN3IUJjEkIMQBkGGpOwwre7+2k2dmjmORh7j+5/RzCWg52x+AVpO8K7nOBKIyn2yZoNHqw3qJ3xCBnH6iXFNsFpmXuoFOQCkjYiNOPtuAXH/Y0J+chUazQ3zvqCcZSyIpfL/PhQ7l+rcJSLL3G0oheot+VRzgEDBESBLFrF5y6HAKl3gggQhlPiZKgcyiIIpiN3yXVfEztDUD0dOF4DfaOy+dc1uM3pa/gn6ctQGh2OF7xitARS4gSWa5ngI096R0gGpa2/2J4M/SbzW8aiGRjAls1JLJJBchN9PLYJCkFnpDWBFTnOCGVEa/WKe7mooz87yq/eMyevmZ082K6Ptfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3056.namprd12.prod.outlook.com (20.178.242.143) by
 MN2PR12MB4143.namprd12.prod.outlook.com (10.255.224.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.23; Thu, 19 Sep 2019 03:04:24 +0000
Received: from MN2PR12MB3056.namprd12.prod.outlook.com
 ([fe80::10e6:34bc:237d:3bd5]) by MN2PR12MB3056.namprd12.prod.outlook.com
 ([fe80::10e6:34bc:237d:3bd5%4]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 03:04:23 +0000
From: <jianzh@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/SRIOV: add navi12 pci id for SRIOV
Thread-Topic: [PATCH] drm/amdgpu/SRIOV: add navi12 pci id for SRIOV
Thread-Index: AQHVbpbwDtpxLcR4KEattH4hOvmp+g==
Date: Thu, 19 Sep 2019 03:04:23 +0000
Message-ID: <20190919030402.29478-1-jianzh@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR03CA0059.apcprd03.prod.outlook.com
 (2603:1096:202:17::29) To MN2PR12MB3056.namprd12.prod.outlook.com
 (2603:10b6:208:ca::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a192b08-b446-4bc1-5f23-08d73cae12ac
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB4143; 
x-ms-traffictypediagnostic: MN2PR12MB4143:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB414329A837D0BEE50D197AE8E1890@MN2PR12MB4143.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(189003)(199004)(486006)(2616005)(6506007)(102836004)(66946007)(6916009)(5660300002)(66446008)(14454004)(66556008)(476003)(71190400001)(8676002)(3846002)(2501003)(8936002)(50226002)(256004)(6116002)(81166006)(386003)(5640700003)(66066001)(6436002)(81156014)(6486002)(305945005)(2351001)(52116002)(2906002)(66476007)(478600001)(71200400001)(4744005)(316002)(99286004)(4326008)(1076003)(36756003)(7736002)(25786009)(64756008)(26005)(54906003)(6512007)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4143;
 H:MN2PR12MB3056.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tuNpygsoX40rRyOSpNx9Rs9xEgzY364gtzaem5uho/K346ytOR7khsLWdfEiBqWw2TY6JcKeplDaQ6gEsV3JHeesosO84AFJ37NA/YtKYLNN804XRnehlL0Sw1cMkJBXnrv0CdOPH3yyxYymot/r6udDw6OV87UnK/qqfo/4bpYZuaaeHbq2P8mWWVTRzSO3LCQCdSinye3uRDxQiktrcqNwFzlePw95ZXohN1MsGaovwLLilc6EDsexyEtdD1hF1zbs+6zCDi7Igt9+6kO1ADBuIRoTlmLNvlPtTd/5/HYrccCLzpae/8Szw/sgZM5Gr/8xLqbltYX1K3LFHnkexDTjpIDkEdElTQXgqwVQC+jv4bPKSwS4aCwOtrumOR+BwCmD/Kimo6Rudg0OZvQbC8X1k8yBroe0At89VYziK7g=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a192b08-b446-4bc1-5f23-08d73cae12ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 03:04:23.6903 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dMqM8/4t2PRUIS7R2wZPfWrfoqTBWrTjQJ+Kb3EKNGisPc5MHtzCAEY1qhtjUCow
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4143
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wZZgAe105MO1Je2U71+FjACRSnpgMtjf4N8o5WDeyw=;
 b=ebV50SlmhPyOAm/cetyWCg//uwpzrXyHafbCW70fUyq4Ow5u3r9vkc9nCioHHzzz0XjFXfEwjwLvespSfC11PnaJgSv9fVNpC38tmGwtitm7rwO3JKveB/GHvlQUNE46wdQORzsuM7df0/GlY6qa9TN2O6PuJuV6O+ZBFwpjSGY=
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
Cc: "Zhao, Jiange" <Jiange.Zhao@amd.com>, "Xiao,
 Jack" <Jack.Xiao@amd.com>, "Deng, Emily" <Emily.Deng@amd.com>, "Nieto,
 David M" <David.Nieto@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmlhbmdlIFpoYW8gPEppYW5nZS5aaGFvQGFtZC5jb20+CgpBZGQgTmF2aTEyIFBDSSBp
ZCBzdXBwb3J0LgoKU2lnbmVkLW9mZi1ieTogSmlhbmdlIFpoYW8gPEppYW5nZS5aaGFvQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgMSArCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZHJ2LmMKaW5kZXggNDIwODg4ZTk0MWRmLi5iNTJjNzI1NWU1ZTQgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKQEAgLTEwMzQsNiArMTAzNCw3IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBwY2lpZGxpc3RbXSA9IHsKIAogCS8qIE5hdmkx
MiAqLwogCXsweDEwMDIsIDB4NzM2MCwgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwgMCwgQ0hJ
UF9OQVZJMTJ9LAorCXsweDEwMDIsIDB4NzM2MiwgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwg
MCwgQ0hJUF9OQVZJMTJ9LAogCiAJezAsIDAsIDB9CiB9OwotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
