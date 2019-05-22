Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A9A25BEE
	for <lists+amd-gfx@lfdr.de>; Wed, 22 May 2019 04:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0854C89701;
	Wed, 22 May 2019 02:27:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730067.outbound.protection.outlook.com [40.107.73.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E7E89701
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 May 2019 02:27:22 +0000 (UTC)
Received: from BYAPR12MB2632.namprd12.prod.outlook.com (20.176.255.209) by
 BYAPR12MB2629.namprd12.prod.outlook.com (20.176.255.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Wed, 22 May 2019 02:27:20 +0000
Received: from BYAPR12MB2632.namprd12.prod.outlook.com
 ([fe80::896f:c96c:96e1:2064]) by BYAPR12MB2632.namprd12.prod.outlook.com
 ([fe80::896f:c96c:96e1:2064%5]) with mapi id 15.20.1900.020; Wed, 22 May 2019
 02:27:20 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Gui, Jack" <Jack.Gui@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: Fix code error for translating int
 type to bool type correctly
Thread-Topic: [PATCH] drm/amd/powerplay: Fix code error for translating int
 type to bool type correctly
Thread-Index: AQHVD8rSf0WK0vHY0UmOk7yTeNmpoqZ2bA7A
Date: Wed, 22 May 2019 02:27:19 +0000
Message-ID: <BYAPR12MB26322ACEEE56D1C439CBA11AFC000@BYAPR12MB2632.namprd12.prod.outlook.com>
References: <1558439172-4802-1-git-send-email-Jack.Gui@amd.com>
In-Reply-To: <1558439172-4802-1-git-send-email-Jack.Gui@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0c3838d-2c6a-4723-df3c-08d6de5d0413
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2629; 
x-ms-traffictypediagnostic: BYAPR12MB2629:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR12MB2629136781A66D4019B2C63BFC000@BYAPR12MB2629.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(376002)(346002)(39860400002)(136003)(189003)(199004)(13464003)(53936002)(3846002)(66556008)(66446008)(6116002)(6246003)(14454004)(8676002)(81156014)(66946007)(73956011)(2501003)(11346002)(2906002)(9686003)(26005)(52536014)(66476007)(76116006)(64756008)(5660300002)(55016002)(186003)(6436002)(316002)(14444005)(478600001)(74316002)(76176011)(486006)(72206003)(256004)(102836004)(53546011)(6306002)(966005)(6506007)(476003)(7696005)(86362001)(66066001)(110136005)(71190400001)(99286004)(71200400001)(68736007)(81166006)(4326008)(305945005)(446003)(25786009)(33656002)(8936002)(7736002)(229853002)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2629;
 H:BYAPR12MB2632.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sOVbqJ8R3LkN/QMgGzwKUDjSMxKZdootb6RR3JnW1oBNo/RKmTXSMqSQA5XuxqVNkpq/F/TsGVhyXd+xxmZPsou2duyt28X6trOcsOWIEj8A+bjHsjsKKTuIgjH9L9sHy11XdWrQZUeo5l6kjbYIPMJKE0EpXMy0v9NVRX5BHsjO3r/kanhPnr1xQw18NFsqwV3momsv955PAfpKm49IcFulBQin/K5AlGSYYt7KLLymr2mEKoKjN1mRiYCA3QtYb/N3erCKA0cAmD39y8SqnKidN1V/O6hTOUZXxar/uLapo4mYGQLSmJtVwcM27nLOfsOpDrZWNKIMfgWavGT4irUpTXHIxoMT8jXSOWdajMenogQbfapkfeBEoDMmbSraiBDsuYpxhoJwAD9Vic329eacldU7fHxZLKMHDhBh3ek=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c3838d-2c6a-4723-df3c-08d6de5d0413
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 02:27:19.9251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2629
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4LKxdw3nVswVEtq2VQGls9W1alT75isqXTvJQO5KeU4=;
 b=HBdpg5/aUyNJZodruCoTLyE5cg46wBKASFYMzi53XK+lRKnggEgGb1fw/8G02nfedFrKodo9aY4hPg1tOlh6SMjVAXg1iSYEKC+OKb8iArA9C1N9AVD4APyrGRCS0A1GwwFly+SvDsqMVu1DlY2Wdtyrp11WByyBFrUYYmGPLxA=
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
Cc: "Gui, Jack" <Jack.Gui@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCg0KUmVn
YXJkcywNCkhhd2tpbmcNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4
IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQ2hl
bmdtaW5nIEd1aQ0KU2VudDogMjAxOeW5tDXmnIgyMeaXpSAxOTo0Ng0KVG86IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogR3VpLCBKYWNrIDxKYWNrLkd1aUBhbWQuY29tPg0KU3Vi
amVjdDogW1BBVENIXSBkcm0vYW1kL3Bvd2VycGxheTogRml4IGNvZGUgZXJyb3IgZm9yIHRyYW5z
bGF0aW5nIGludCB0eXBlIHRvIGJvb2wgdHlwZSBjb3JyZWN0bHkNCg0KW0NBVVRJT046IEV4dGVy
bmFsIEVtYWlsXQ0KDQpGaXggY29kZSBlcnJvciB0byBzdXBwb3J0IHZhbHVlIDwgMCBvciA+IDEu
DQoNClNpZ25lZC1vZmYtYnk6IENoZW5nbWluZyBHdWkgPEphY2suR3VpQGFtZC5jb20+DQotLS0N
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgfCAyICstDQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMNCmluZGV4IDNhNDcxMzAuLmQ1ZjAzYjkg
MTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMN
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYw0KQEAgLTM0
OCw3ICszNDgsNyBAQCBzdGF0aWMgaW50IHNtdV9lYXJseV9pbml0KHZvaWQgKmhhbmRsZSkNCiAg
ICAgICAgc3RydWN0IHNtdV9jb250ZXh0ICpzbXUgPSAmYWRldi0+c211Ow0KDQogICAgICAgIHNt
dS0+YWRldiA9IGFkZXY7DQotICAgICAgIHNtdS0+cG1fZW5hYmxlZCA9IGFtZGdwdV9kcG07DQor
ICAgICAgIHNtdS0+cG1fZW5hYmxlZCA9ICEhYW1kZ3B1X2RwbTsNCiAgICAgICAgbXV0ZXhfaW5p
dCgmc211LT5tdXRleCk7DQoNCiAgICAgICAgcmV0dXJuIHNtdV9zZXRfZnVuY3MoYWRldik7DQot
LQ0KMi43LjQNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
