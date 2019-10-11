Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B47D42FD
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 16:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1607A6E0C8;
	Fri, 11 Oct 2019 14:36:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700041.outbound.protection.outlook.com [40.107.70.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E206E0C8
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 14:36:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MG2ROAlQDqLFoDboOyPGrq913qlzpsUenJfg12/ZbYboQTZ/Ln1nULEAnXKm2R9PhW+JOx+qqPgNWuR148u1x1vBXUm0r4Pmq2DcoRdI9FcbWxmaIQBXBsOhX+5GjWF1G7v8CNC6YD/hs6+XSJ7eoAeM2gIIy5KtLBsR8tHq0WY4DFCnB6Ll8bsPG5Sg1/Xd1kKEShod5QJeWkVozkxRFsZic933YBfwwK724XoHNTpih5Fa704JwLynUVucfmtkWz9/4Anei2AswrZOP6tulYCHOpcFowEvYbKN/txMcWd0okbQ/SU2FE0n8I5pC/e83z+iFYxbXv6Ui7xVhGI+qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzJxRsbLtj0nOTkO2oObHYU7wdscseQEp+uXDDGxu/c=;
 b=aPJ4J6uUpVxlmxIlcVqXz3DRHIYCeum7R42DL/svUOWxxKk8ytbHpKNfXJASOIWxEFF1Ue0xVuk5c/KdvIO7nb7ihbBQ1ZnLjlBBoXLa6nZnWNU25l88VB4F0IitlnopjcpImujgADiEX9OC73ad+TGSmGrETPo72IpraBOVeV0cdDkwxHpLFOxXIvy1JHbEia9jASyNtcK7XQDMGEj/RcCopeBD8AIGI5pVxC1L1cEb7zxV85qGIhFR+oU4WYhufSWhQSmVsEzIUZiv7E6yGFhjUEEfgIObhbKwCDHqiBfGFGnc4T7NmxKCrtvoYsy2M+TRLlpvah/dqwQYeK31BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1374.namprd12.prod.outlook.com (10.169.206.9) by
 MWHPR12MB1712.namprd12.prod.outlook.com (10.175.55.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 14:36:54 +0000
Received: from MWHPR12MB1374.namprd12.prod.outlook.com
 ([fe80::b99b:3d36:80fa:1192]) by MWHPR12MB1374.namprd12.prod.outlook.com
 ([fe80::b99b:3d36:80fa:1192%7]) with mapi id 15.20.2347.021; Fri, 11 Oct 2019
 14:36:54 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>,
 "thejoe@gmail.com" <thejoe@gmail.com>
Subject: [PATCH v3] drm/amdgpu: user pages array memory leak fix
Thread-Topic: [PATCH v3] drm/amdgpu: user pages array memory leak fix
Thread-Index: AQHVgEFTkdALhneXtEiXdTXz5Xf4Yw==
Date: Fri, 11 Oct 2019 14:36:53 +0000
Message-ID: <20191011143620.8785-1-Philip.Yang@amd.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::44) To MWHPR12MB1374.namprd12.prod.outlook.com
 (2603:10b6:300:12::9)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b174aed-e3db-4a2e-64b2-08d74e5875c0
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MWHPR12MB1712:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1712C7B8256B7D937B026415E6970@MWHPR12MB1712.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:184;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(366004)(396003)(346002)(376002)(189003)(199004)(386003)(5660300002)(7736002)(4326008)(486006)(99286004)(52116002)(316002)(305945005)(1076003)(110136005)(66574012)(25786009)(2616005)(2906002)(476003)(26005)(6506007)(6116002)(3846002)(966005)(86362001)(102836004)(186003)(478600001)(64756008)(6512007)(6306002)(81166006)(71190400001)(8676002)(14454004)(2501003)(8936002)(81156014)(66556008)(66476007)(66446008)(66066001)(6486002)(66946007)(71200400001)(6436002)(14444005)(256004)(36756003)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1712;
 H:MWHPR12MB1374.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rSCMkF2xsZeFchLDGfB7m/NICl1+mYaz3QgGnUhGH5b4zRHxV5f+91IJaTakqVICAoOP8a+ucWAlONYfd2ZZOM9t7Ebc3CZifZ5Uko6xIklGoQnqzcLJe2/Z5TVvo+/Q2ngJuFSRjzCY0qVNVf2kyy+VoI6HsvLsqc+jHn8bur/1z8KmdOiAZIW/unVyjoxTvCT1fso+3XAIWZKR9p0ZQKGvHr43dVZiId6vqix5meaXPveVOwqAzpK8DRhN0+6fJ4Gj31t+Ek9/kEMwedD2GxmoWDnHHjN860qZnUUfYXnqjWMZzjqzLDil83TOdGGzNImB3kJIoM/d4hs2OJCHn0fIl8wbv5D4e+SdG0jrU2Td6jHB1hXcHSX1CRz5kUWzoBeZaH4d1pBvU6aIGPXEoB0stZAILy/1ZOodTRHpyG5OZTlzLvI3VChPOYP0XHAGxXAZm9CLS37kWEPfyIgUEA==
Content-ID: <67A477DEDD9A3149BEE57273D64A0601@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b174aed-e3db-4a2e-64b2-08d74e5875c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 14:36:53.9134 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9DtbksP1yPs8GFpywiQV1jTxC5rMihAXGcXscJviKm253r8ShDrblCYnyy+U8M21
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1712
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzJxRsbLtj0nOTkO2oObHYU7wdscseQEp+uXDDGxu/c=;
 b=3BdtBIc6mJCuh9K3GzKQRYUl7WUDd1YGsDNIbi/kQjLB7wUAi9vo5EcEW/TiyIkFl+fFJLNpHfboDz9YYCUIUa7BL1dueGMrcOjxQhZwstk70Bwi+hU00Ti8/Zb+ZLxFhj29J1h9tZdFIisq5Di8G/YZ6NMlAgKGhGO5Ao8PlOg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
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
Cc: "Yang, Philip" <Philip.Yang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

dXNlcl9wYWdlcyBhcnJheSBzaG91bGQgYWx3YXlzIGJlIGZyZWVkIGFmdGVyIHZhbGlkYXRpb24g
cmVnYXJkbGVzcyBpZg0KdXNlciBwYWdlcyBhcmUgY2hhbmdlZCBhZnRlciBibyBpcyBjcmVhdGVk
IGJlY2F1c2Ugd2l0aCBITU0gY2hhbmdlIHBhcnNlDQpibyBhbHdheXMgYWxsb2NhdGUgdXNlciBw
YWdlcyBhcnJheSB0byBnZXQgdXNlciBwYWdlcyBmb3IgdXNlcnB0ciBiby4NCg0KdjI6IHJlbW92
ZSB1bnVzZWQgbG9jYWwgdmFyaWFibGUgYW5kIGFtZW5kIGNvbW1pdA0KDQp2MzogYWRkIGJhY2sg
Z2V0IHVzZXIgcGFnZXMgaW4gZ2VtX3VzZXJwdHJfaW9jdGwsIHRvIGRldGVjdCBhcHBsaWNhdGlv
bg0KYnVnIHdoZXJlIGFuIHVzZXJwdHIgVk1BIGlzIG5vdCBhbmFueW1vdXMgbWVtb3J5IGFuZCBy
ZWplY3QgaXQuDQoNCkJ1Z3ppbGxhOiBodHRwczovL2J1Z3MubGF1bmNocGFkLm5ldC91YnVudHUv
K3NvdXJjZS9saW51eC8rYnVnLzE4NDQ5NjINCg0KU2lnbmVkLW9mZi1ieTogUGhpbGlwIFlhbmcg
PFBoaWxpcC5ZYW5nQGFtZC5jb20+DQpUZXN0ZWQtYnk6IEpvZSBCYXJuZXR0IDx0aGVqb2VAZ21h
aWwuY29tPg0KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jIHwg
NCArLS0tDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQ0K
DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYw0KaW5kZXggYzE4YTE1M2IzZDJh
Li5lN2IzOWRhYTIyZjYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfY3MuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMN
CkBAIC00NzYsNyArNDc2LDYgQEAgc3RhdGljIGludCBhbWRncHVfY3NfbGlzdF92YWxpZGF0ZShz
dHJ1Y3QgYW1kZ3B1X2NzX3BhcnNlciAqcCwNCiANCiAJbGlzdF9mb3JfZWFjaF9lbnRyeShsb2Jq
LCB2YWxpZGF0ZWQsIHR2LmhlYWQpIHsNCiAJCXN0cnVjdCBhbWRncHVfYm8gKmJvID0gdHRtX3Rv
X2FtZGdwdV9ibyhsb2JqLT50di5ibyk7DQotCQlib29sIGJpbmRpbmdfdXNlcnB0ciA9IGZhbHNl
Ow0KIAkJc3RydWN0IG1tX3N0cnVjdCAqdXNlcm1tOw0KIA0KIAkJdXNlcm1tID0gYW1kZ3B1X3R0
bV90dF9nZXRfdXNlcm1tKGJvLT50Ym8udHRtKTsNCkBAIC00OTMsMTQgKzQ5MiwxMyBAQCBzdGF0
aWMgaW50IGFtZGdwdV9jc19saXN0X3ZhbGlkYXRlKHN0cnVjdCBhbWRncHVfY3NfcGFyc2VyICpw
LA0KIA0KIAkJCWFtZGdwdV90dG1fdHRfc2V0X3VzZXJfcGFnZXMoYm8tPnRiby50dG0sDQogCQkJ
CQkJICAgICBsb2JqLT51c2VyX3BhZ2VzKTsNCi0JCQliaW5kaW5nX3VzZXJwdHIgPSB0cnVlOw0K
IAkJfQ0KIA0KIAkJciA9IGFtZGdwdV9jc192YWxpZGF0ZShwLCBibyk7DQogCQlpZiAocikNCiAJ
CQlyZXR1cm4gcjsNCiANCi0JCWlmIChiaW5kaW5nX3VzZXJwdHIpIHsNCisJCWlmIChsb2JqLT51
c2VyX3BhZ2VzKSB7DQogCQkJa3ZmcmVlKGxvYmotPnVzZXJfcGFnZXMpOw0KIAkJCWxvYmotPnVz
ZXJfcGFnZXMgPSBOVUxMOw0KIAkJfQ0KLS0gDQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
