Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 861F595737
	for <lists+amd-gfx@lfdr.de>; Tue, 20 Aug 2019 08:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204786E5DE;
	Tue, 20 Aug 2019 06:17:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810084.outbound.protection.outlook.com [40.107.81.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F75C6E5DE
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Aug 2019 06:17:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sj6EuW3Wic0drPyjpHNgAGk4cp/eRsYl73fQ+AAaq2UtJ49Cy/xOZ4rSqNRBm9d80YlPJ1YmEuk5hf2q4WpZtbScib1XAvYbttWXUOrkZFLSyKIV9IVhHx9+Kb1pwA5wlG0kEoeoP0F2iT3mUxgPLW6ULDaq5IdfbDkQGlZyQaAT8Wco5zFzO0nHO9DvB6duInw23tkKhcylQmPhDfCNdxgi9agXRpb7xmwEZdwc9T1Ig6ZrE/fgYu0K+fkvL4g39wQDhTEZ8Eka0i37Ycjl43vMTO78l932+8eyqDWgH801ks7tT6dfRcAJAgt6zTIc/SOudcbOk/exDyjF+LU4Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMj+gG0yerOTvTifhy2vVxV7XO7J9b70tnKo08blDnE=;
 b=OIAneYivtSBbTiLqYi0DgCJshf2b2xkA0xVsStqG7yTkxVNZbeQ6u9D0h5SUmRkrntWdMxp31KT1R5QvhFHgD1v7HTPXi+gx8woyUuRv1b9TSG9sjGKBTK2p2I+40FObUHxymK5CELXh3uaIT9gbSB3ZlL+LgPSPMsgh0WzYdiW1JkDIfvE612hi+NeZTF0svtfKzoJ/y+YRlmiO8u3XwobEcy3ExJRF9LG/1sMb1gxVkj/EAybehU+x+kvxiVSztrVuiUitZAi6qgJU88zfFKpiyaSbqBCJMq13upDiJFKg5k/1xpQ7blS8cMK8fJY5RPyp9h9F+GzwoUI+T2QvvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB3718.namprd12.prod.outlook.com (52.132.244.84) by
 CH2PR12MB3943.namprd12.prod.outlook.com (52.132.246.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Tue, 20 Aug 2019 06:17:30 +0000
Received: from CH2PR12MB3718.namprd12.prod.outlook.com
 ([fe80::3d37:5989:ecd9:2383]) by CH2PR12MB3718.namprd12.prod.outlook.com
 ([fe80::3d37:5989:ecd9:2383%5]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 06:17:30 +0000
From: "Min, Frank" <Frank.Min@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>, "Ashkar, Alexander"
 <Alexander.Ashkar@amd.com>
Subject: =?gb2312?B?tPC4tDogW1BBVENIXSBhbWQvYW1kZ3B1OiBzZXBlcmF0ZSBzcmlvdiBmYiBh?=
 =?gb2312?Q?perture_setting?=
Thread-Topic: [PATCH] amd/amdgpu: seperate sriov fb aperture setting
Thread-Index: AQHVVx5JGtKd0ulG+0uQEUCAc7xEKKcDjnqA
Date: Tue, 20 Aug 2019 06:17:30 +0000
Message-ID: <CH2PR12MB371835E014CA18AE696D4A39E9AB0@CH2PR12MB3718.namprd12.prod.outlook.com>
References: <1566281557-4507-1-git-send-email-Frank.Min@amd.com>
In-Reply-To: <1566281557-4507-1-git-send-email-Frank.Min@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5791e7a4-4ae0-4468-1e15-08d7253614dc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CH2PR12MB3943; 
x-ms-traffictypediagnostic: CH2PR12MB3943:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB3943D8AD332FABC3FACBB746E9AB0@CH2PR12MB3943.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(199004)(189003)(102836004)(2501003)(6506007)(8936002)(26005)(74316002)(186003)(305945005)(64756008)(66556008)(316002)(53936002)(446003)(476003)(81156014)(81166006)(71200400001)(7736002)(71190400001)(25786009)(486006)(11346002)(478600001)(224303003)(6436002)(5660300002)(76176011)(86362001)(7696005)(66476007)(52536014)(6636002)(66446008)(14454004)(76116006)(9686003)(55016002)(66946007)(66066001)(6116002)(3846002)(256004)(110136005)(14444005)(33656002)(2906002)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3943;
 H:CH2PR12MB3718.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FDH+J6CX6445LtBCViUfRcQx+FVsYeuH2SEm4Om+2nSMZz9u8VWxcl4tFgP8m4+YjwjH6onQDl4nTOoMxACwMwjXlZ71fJ66pXkMejXe5TCHEC8ZU9uy9VcbLIb87JE42ckQnzQkFjXB4KvrIKBS4AgR2MCd1qmNPLDUrRhgvBhvd2UkWqTdM2SQius6/HKK/wrVfAkzxJNBUhl5XWjclTWg3hUthC3KbfRpU4G63IK6P7KIFu5DZ9er7/PerwaCIflSd9E4BBoPI661T+XFF/WpF0IE2CxDUjfoAPLaR6JC1FysLm+aK5Cu0e1QL+DuTVU+c2ClO8IOdduNpn+HGjPwI/J6wj9vgDtGZbyAceP2B1rKYkhzcRNMEOJG5XTx8k7LcXme22WlRPlvAyO5E0C6L2a+JXCxF72Thw7SulA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5791e7a4-4ae0-4468-1e15-08d7253614dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 06:17:30.3446 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S5GLqmSrpKvkr4vR9xeR2PBzCO3vtgjNAvO3mxJHhbjpcK4zWhtp+UusHPCRwT6N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3943
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMj+gG0yerOTvTifhy2vVxV7XO7J9b70tnKo08blDnE=;
 b=p4TyOeVwBqxFpUORlNh0sbxJZia9jlocdubvoPvoR/0J2EEtqp5G8yxoxTesjFnyHOSEL2A1OUYszZsPUAIod96YDo/RpzGE38GhWoeKPEhhSGdTGWMbZi6CPGXGsv40nRu+A0BDAvDwB93wjMImqM2FLBruHyAeg3i6JlCalBI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Frank.Min@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgQWxleC9DaHJpc3RpYW4sDQpJIGhhdmUgdXBkYXRlIHRoZSBwcmV2aW91cyBwYXRjaC4gV291
bGQgeW91IHBsZWFzZSBoZWxwIHRvIHJldmlldyBpdD8NCkhlcmUgaXMgdGhlIHVwZGF0ZWQgcGFy
dCBjb21wYXJlZCB3aXRoIGxhc3QgcGF0Y2gNCg0KVGhlIGNoYW5nZSBoZXJlIGlzIHRvIGFkYXB0
IHZlZ2ExMCBzcmlvdiBuZWVkIHRvIHVzZSB0aGUgbWMgYmFzZSBmcm9tIDAsIGluc3RlYWQgb2Yg
cmVhZCB0aGUgY29uZmlnIGZyb20gbW1odWIuDQoNCi0JaWYgKCFhbWRncHVfc3Jpb3ZfdmYoYWRl
dikpIHsNCi0JCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9BUkNUVVJVUykNCi0JCQliYXNl
ID0gbW1odWJfdjlfNF9nZXRfZmJfbG9jYXRpb24oYWRldik7DQotCQllbHNlDQotCQkJYmFzZSA9
IG1taHViX3YxXzBfZ2V0X2ZiX2xvY2F0aW9uKGFkZXYpOw0KLQl9DQorDQorCWlmIChhZGV2LT5h
c2ljX3R5cGUgPT0gQ0hJUF9BUkNUVVJVUykNCisJCWJhc2UgPSBtbWh1Yl92OV80X2dldF9mYl9s
b2NhdGlvbihhZGV2KTsNCisJZWxzZSBpZiAoIWFtZGdwdV9zcmlvdl92ZihhZGV2KSkNCisJCWJh
c2UgPSBtbWh1Yl92MV8wX2dldF9mYl9sb2NhdGlvbihhZGV2KTsNCisNCg0KLS0tLS3pgq7ku7bl
jp/ku7YtLS0tLQ0K5Y+R5Lu25Lq6OiBGcmFuay5NaW4gPEZyYW5rLk1pbkBhbWQuY29tPiANCuWP
kemAgeaXtumXtDogMjAxOeW5tDjmnIgyMOaXpSAxNDoxMw0K5pS25Lu25Lq6OiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0K5oqE6YCBOiBNaW4sIEZyYW5rIDxGcmFuay5NaW5AYW1kLmNv
bT4NCuS4u+mimDogW1BBVENIXSBhbWQvYW1kZ3B1OiBzZXBlcmF0ZSBzcmlvdiBmYiBhcGVydHVy
ZSBzZXR0aW5nDQoNCnNyaW92IHdvdWxkIG5vdCB1c2UgYWdwLCBzbyBzZXBlcmF0ZSB0aGUgZmIg
YXBlcnR1cmUgc2V0dGluZy4NCg0KQ2hhbmdlLUlkOiBJMTM3MmNkMzU1MzI2NzMxYTMxMzYxYmZm
MTNkNzllMTIxMjFiODY1MQ0KU2lnbmVkLW9mZi1ieTogRnJhbmsuTWluIDxGcmFuay5NaW5AYW1k
LmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeGh1Yl92MV8wLmMgfCAz
OSArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dtY192OV8wLmMgICAgfCAxMiArKysrKy0tLS0tDQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvbW1odWJfdjlfNC5jICB8IDI3ICsrKysrKysrKysrKysrKy0tLS0tLS0NCiAzIGZp
bGVzIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHViX3YxXzAuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dmeGh1Yl92MV8wLmMNCmluZGV4IDZjZTM3Y2UuLmVjNzhjOGIg
MTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhodWJfdjFfMC5jDQor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhodWJfdjFfMC5jDQpAQCAtNzUsMjMg
Kzc1LDMyIEBAIHN0YXRpYyB2b2lkIGdmeGh1Yl92MV8wX2luaXRfc3lzdGVtX2FwZXJ0dXJlX3Jl
Z3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQogCVdSRUczMl9TT0MxNV9STEMoR0MsIDAs
IG1tTUNfVk1fQUdQX0JPVCwgYWRldi0+Z21jLmFncF9zdGFydCA+PiAyNCk7DQogCVdSRUczMl9T
T0MxNV9STEMoR0MsIDAsIG1tTUNfVk1fQUdQX1RPUCwgYWRldi0+Z21jLmFncF9lbmQgPj4gMjQp
Ow0KIA0KLQkvKiBQcm9ncmFtIHRoZSBzeXN0ZW0gYXBlcnR1cmUgbG93IGxvZ2ljYWwgcGFnZSBu
dW1iZXIuICovDQotCVdSRUczMl9TT0MxNV9STEMoR0MsIDAsIG1tTUNfVk1fU1lTVEVNX0FQRVJU
VVJFX0xPV19BRERSLA0KLQkJICAgICBtaW4oYWRldi0+Z21jLmZiX3N0YXJ0LCBhZGV2LT5nbWMu
YWdwX3N0YXJ0KSA+PiAxOCk7DQorCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikpIHsNCisJCS8q
IFByb2dyYW0gdGhlIHN5c3RlbSBhcGVydHVyZSBsb3cgbG9naWNhbCBwYWdlIG51bWJlci4gKi8N
CisJCVdSRUczMl9TT0MxNV9STEMoR0MsIDAsIG1tTUNfVk1fU1lTVEVNX0FQRVJUVVJFX0xPV19B
RERSLA0KKwkJCQkgYWRldi0+Z21jLmZiX3N0YXJ0ID4+IDE4KTsNCiANCi0JaWYgKGFkZXYtPmFz
aWNfdHlwZSA9PSBDSElQX1JBVkVOICYmIGFkZXYtPnJldl9pZCA+PSAweDgpDQotCQkvKg0KLQkJ
ICogUmF2ZW4yIGhhcyBhIEhXIGlzc3VlIHRoYXQgaXQgaXMgdW5hYmxlIHRvIHVzZSB0aGUgdnJh
bSB3aGljaA0KLQkJICogaXMgb3V0IG9mIE1DX1ZNX1NZU1RFTV9BUEVSVFVSRV9ISUdIX0FERFIu
IFNvIGhlcmUgaXMgdGhlDQotCQkgKiB3b3JrYXJvdW5kIHRoYXQgaW5jcmVhc2Ugc3lzdGVtIGFw
ZXJ0dXJlIGhpZ2ggYWRkcmVzcyAoYWRkIDEpDQotCQkgKiB0byBnZXQgcmlkIG9mIHRoZSBWTSBm
YXVsdCBhbmQgaGFyZHdhcmUgaGFuZy4NCi0JCSAqLw0KIAkJV1JFRzMyX1NPQzE1X1JMQyhHQywg
MCwgbW1NQ19WTV9TWVNURU1fQVBFUlRVUkVfSElHSF9BRERSLA0KLQkJCSAgICAgbWF4KChhZGV2
LT5nbWMuZmJfZW5kID4+IDE4KSArIDB4MSwNCi0JCQkJIGFkZXYtPmdtYy5hZ3BfZW5kID4+IDE4
KSk7DQotCWVsc2UNCi0JCVdSRUczMl9TT0MxNV9STEMoR0MsIDAsIG1tTUNfVk1fU1lTVEVNX0FQ
RVJUVVJFX0hJR0hfQUREUiwNCi0JCQkgICAgIG1heChhZGV2LT5nbWMuZmJfZW5kLCBhZGV2LT5n
bWMuYWdwX2VuZCkgPj4gMTgpOw0KKwkJCQkgYWRldi0+Z21jLmZiX2VuZCA+PiAxOCk7DQorCX0g
ZWxzZSB7DQorCQkvKiBQcm9ncmFtIHRoZSBzeXN0ZW0gYXBlcnR1cmUgbG93IGxvZ2ljYWwgcGFn
ZSBudW1iZXIuICovDQorCQlXUkVHMzJfU09DMTVfUkxDKEdDLCAwLCBtbU1DX1ZNX1NZU1RFTV9B
UEVSVFVSRV9MT1dfQUREUiwNCisJCQkgICAgIG1pbihhZGV2LT5nbWMuZmJfc3RhcnQsIGFkZXYt
PmdtYy5hZ3Bfc3RhcnQpID4+IDE4KTsNCisNCisJCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJ
UF9SQVZFTiAmJiBhZGV2LT5yZXZfaWQgPj0gMHg4KQ0KKwkJCS8qDQorCQkJICogUmF2ZW4yIGhh
cyBhIEhXIGlzc3VlIHRoYXQgaXQgaXMgdW5hYmxlIHRvIHVzZSB0aGUgdnJhbSB3aGljaA0KKwkJ
CSAqIGlzIG91dCBvZiBNQ19WTV9TWVNURU1fQVBFUlRVUkVfSElHSF9BRERSLiBTbyBoZXJlIGlz
IHRoZQ0KKwkJCSAqIHdvcmthcm91bmQgdGhhdCBpbmNyZWFzZSBzeXN0ZW0gYXBlcnR1cmUgaGln
aCBhZGRyZXNzIChhZGQgMSkNCisJCQkgKiB0byBnZXQgcmlkIG9mIHRoZSBWTSBmYXVsdCBhbmQg
aGFyZHdhcmUgaGFuZy4NCisJCQkgKi8NCisJCQlXUkVHMzJfU09DMTVfUkxDKEdDLCAwLCBtbU1D
X1ZNX1NZU1RFTV9BUEVSVFVSRV9ISUdIX0FERFIsDQorCQkJCSAgICAgbWF4KChhZGV2LT5nbWMu
ZmJfZW5kID4+IDE4KSArIDB4MSwNCisJCQkJCSBhZGV2LT5nbWMuYWdwX2VuZCA+PiAxOCkpOw0K
KwkJZWxzZQ0KKwkJCVdSRUczMl9TT0MxNV9STEMoR0MsIDAsIG1tTUNfVk1fU1lTVEVNX0FQRVJU
VVJFX0hJR0hfQUREUiwNCisJCQkJICAgICBtYXgoYWRldi0+Z21jLmZiX2VuZCwgYWRldi0+Z21j
LmFncF9lbmQpID4+IDE4KTsNCisJfQ0KIA0KIAkvKiBTZXQgZGVmYXVsdCBwYWdlIGFkZHJlc3Mu
ICovDQogCXZhbHVlID0gYWRldi0+dnJhbV9zY3JhdGNoLmdwdV9hZGRyIC0gYWRldi0+Z21jLnZy
YW1fc3RhcnQgZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8w
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jDQppbmRleCA2ZGUxNzI2
Li42ODNmNDdkIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5
XzAuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KQEAgLTky
MCwxMiArOTIwLDEyIEBAIHN0YXRpYyB2b2lkIGdtY192OV8wX3ZyYW1fZ3R0X2xvY2F0aW9uKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KIAkJCQkJc3RydWN0IGFtZGdwdV9nbWMgKm1jKQ0K
IHsNCiAJdTY0IGJhc2UgPSAwOw0KLQlpZiAoIWFtZGdwdV9zcmlvdl92ZihhZGV2KSkgew0KLQkJ
aWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX0FSQ1RVUlVTKQ0KLQkJCWJhc2UgPSBtbWh1Yl92
OV80X2dldF9mYl9sb2NhdGlvbihhZGV2KTsNCi0JCWVsc2UNCi0JCQliYXNlID0gbW1odWJfdjFf
MF9nZXRfZmJfbG9jYXRpb24oYWRldik7DQotCX0NCisNCisJaWYgKGFkZXYtPmFzaWNfdHlwZSA9
PSBDSElQX0FSQ1RVUlVTKQ0KKwkJYmFzZSA9IG1taHViX3Y5XzRfZ2V0X2ZiX2xvY2F0aW9uKGFk
ZXYpOw0KKwllbHNlIGlmICghYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKQ0KKwkJYmFzZSA9IG1taHVi
X3YxXzBfZ2V0X2ZiX2xvY2F0aW9uKGFkZXYpOw0KKw0KIAkvKiBhZGQgdGhlIHhnbWkgb2Zmc2V0
IG9mIHRoZSBwaHlzaWNhbCBub2RlICovDQogCWJhc2UgKz0gYWRldi0+Z21jLnhnbWkucGh5c2lj
YWxfbm9kZV9pZCAqIGFkZXYtPmdtYy54Z21pLm5vZGVfc2VnbWVudF9zaXplOw0KIAlhbWRncHVf
Z21jX3ZyYW1fbG9jYXRpb24oYWRldiwgbWMsIGJhc2UpOyBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjlfNC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvbW1odWJfdjlfNC5jDQppbmRleCAwY2Y3ZWY0Li5lYTMzNTlmIDEwMDY0NA0KLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjlfNC5jDQorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9tbWh1Yl92OV80LmMNCkBAIC0xMTgsMTQgKzExOCwyNSBAQCBzdGF0aWMg
dm9pZCBtbWh1Yl92OV80X2luaXRfc3lzdGVtX2FwZXJ0dXJlX3JlZ3Moc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsDQogCQkJICAgIGFkZXYtPmdtYy5hZ3Bfc3RhcnQgPj4gMjQpOw0KIA0KIAkv
KiBQcm9ncmFtIHRoZSBzeXN0ZW0gYXBlcnR1cmUgbG93IGxvZ2ljYWwgcGFnZSBudW1iZXIuICov
DQotCVdSRUczMl9TT0MxNV9PRkZTRVQoTU1IVUIsIDAsDQotCQkJICAgIG1tVk1TSEFSRURWQzBf
TUNfVk1fU1lTVEVNX0FQRVJUVVJFX0xPV19BRERSLA0KLQkJCSAgICBodWJpZCAqIE1NSFVCX0lO
U1RBTkNFX1JFR0lTVEVSX09GRlNFVCwNCi0JCQkgICAgbWluKGFkZXYtPmdtYy5mYl9zdGFydCwg
YWRldi0+Z21jLmFncF9zdGFydCkgPj4gMTgpOw0KLQlXUkVHMzJfU09DMTVfT0ZGU0VUKE1NSFVC
LCAwLA0KLQkJCSAgICBtbVZNU0hBUkVEVkMwX01DX1ZNX1NZU1RFTV9BUEVSVFVSRV9ISUdIX0FE
RFIsDQotCQkJICAgIGh1YmlkICogTU1IVUJfSU5TVEFOQ0VfUkVHSVNURVJfT0ZGU0VULA0KLQkJ
CSAgICBtYXgoYWRldi0+Z21jLmZiX2VuZCwgYWRldi0+Z21jLmFncF9lbmQpID4+IDE4KTsNCisJ
aWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSkgew0KKwkJV1JFRzMyX1NPQzE1X09GRlNFVChNTUhV
QiwgMCwNCisJCQkJCW1tVk1TSEFSRURWQzBfTUNfVk1fU1lTVEVNX0FQRVJUVVJFX0xPV19BRERS
LA0KKwkJCQkJaHViaWQgKiBNTUhVQl9JTlNUQU5DRV9SRUdJU1RFUl9PRkZTRVQsDQorCQkJCQlh
ZGV2LT5nbWMuZmJfc3RhcnQgPj4gMTgpOw0KKwkJV1JFRzMyX1NPQzE1X09GRlNFVChNTUhVQiwg
MCwNCisJCQkJCW1tVk1TSEFSRURWQzBfTUNfVk1fU1lTVEVNX0FQRVJUVVJFX0hJR0hfQUREUiwN
CisJCQkJCWh1YmlkICogTU1IVUJfSU5TVEFOQ0VfUkVHSVNURVJfT0ZGU0VULA0KKwkJCQkJYWRl
di0+Z21jLmZiX2VuZCA+PiAxOCk7DQorCX0gZWxzZSB7DQorCQlXUkVHMzJfU09DMTVfT0ZGU0VU
KE1NSFVCLCAwLA0KKwkJCQkgICAgbW1WTVNIQVJFRFZDMF9NQ19WTV9TWVNURU1fQVBFUlRVUkVf
TE9XX0FERFIsDQorCQkJCSAgICBodWJpZCAqIE1NSFVCX0lOU1RBTkNFX1JFR0lTVEVSX09GRlNF
VCwNCisJCQkJICAgIG1pbihhZGV2LT5nbWMuZmJfc3RhcnQsIGFkZXYtPmdtYy5hZ3Bfc3RhcnQp
ID4+IDE4KTsNCisJCVdSRUczMl9TT0MxNV9PRkZTRVQoTU1IVUIsIDAsDQorCQkJCSAgICBtbVZN
U0hBUkVEVkMwX01DX1ZNX1NZU1RFTV9BUEVSVFVSRV9ISUdIX0FERFIsDQorCQkJCSAgICBodWJp
ZCAqIE1NSFVCX0lOU1RBTkNFX1JFR0lTVEVSX09GRlNFVCwNCisJCQkJICAgIG1heChhZGV2LT5n
bWMuZmJfZW5kLCBhZGV2LT5nbWMuYWdwX2VuZCkgPj4gMTgpOw0KKwl9DQogDQogCS8qIFNldCBk
ZWZhdWx0IHBhZ2UgYWRkcmVzcy4gKi8NCiAJdmFsdWUgPSBhZGV2LT52cmFtX3NjcmF0Y2guZ3B1
X2FkZHIgLSBhZGV2LT5nbWMudnJhbV9zdGFydCArDQotLQ0KMi43LjQNCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
