Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B3612B290
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Dec 2019 09:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61ADA89948;
	Fri, 27 Dec 2019 08:08:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C933389948
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Dec 2019 08:08:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHgvMOVjlu8WRlzs7CDuYMZoynf6gnYchj7DIB20R52S4TQ+s56bjS8qGlfIu2bfeSkuGd0Ab9KY4j3hGA2iEkTYHyiwZGxvtw7GojWz1cXHsN0rNL+EyVdaD7w52aNgLKFQU/7N0aO0jCELo4PRn6InJfnKRgcFip9oaTBUXjot8JfG4F8DfbYQXKnzCpWkFZK/eibZYtp+jdqy206m+3UcHMz1NXmOt0tMjk7RWuYPK6gqxiyTOaB5tuBlynWdSXzGo9hNLtOoZfkMuOX+HfH0hrVJo4tYRCp5airDS2NOGN/5592HSJepTFFaUHyu+4jCEiccZrpZqPP3LYda9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbS6xxvWEBXRKzlYtrOYyPFEWspJ18UOa1dxK7yzbjo=;
 b=B1LkDspERMrcjORW62mgnhxM3dymthkKWs3mzgDWngtvtXwsFlOHHG4lGg53hOiKkJ/d1+VXy/KAxbsdShQ9R70R7FQSxPBzkFOBklui/GudL9ZG03PMm9LDI56YrvQxbWC9MRvu7WV849KQOYt+bj06IAKyImfrP1aJZeuH6cseAvNmJw+ewHZyBEce7GWjO3fPjM6IKNCwI0fkRZjvO2DhsejvKrc2dLY/r+7pr0sqxAptnP33yOVpYt5+GphuvvYdIzAxVKxUD+9i4uPbiYePekZoYD+/20OZb/jmBE/klscq9OAKbePNzJhHuPhHBSdaLpf8jMi19JdW8q8aHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbS6xxvWEBXRKzlYtrOYyPFEWspJ18UOa1dxK7yzbjo=;
 b=ne4j4tUkfmRgXPTUCyRMRIMZPjfXNJplZiZvHugcsr3+bZXgFtkAG+Qn52mut5Rzz7h9d2nsA8k0dAi07bXfEhBFFPT3q4SFVI30QvFRJHHZmk1vRujD24tv2HR08SSC9C1BYqvnZUIogo5wE7dGRTwzN0MzkOlpnC1dhTEGLSU=
Received: from CH2PR12MB3672.namprd12.prod.outlook.com (52.132.246.139) by
 CH2PR12MB3909.namprd12.prod.outlook.com (52.132.231.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11; Fri, 27 Dec 2019 08:08:49 +0000
Received: from CH2PR12MB3672.namprd12.prod.outlook.com
 ([fe80::31df:679e:d23f:3c2b]) by CH2PR12MB3672.namprd12.prod.outlook.com
 ([fe80::31df:679e:d23f:3c2b%4]) with mapi id 15.20.2581.007; Fri, 27 Dec 2019
 08:08:49 +0000
From: "Zhang, Jack (Jian)" <Jack.Zhang1@amd.com>
To: "Deng, Emily" <Emily.Deng@amd.com>, "Feng, Kenneth"
 <Kenneth.Feng@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Quan, Evan" <Evan.Quan@amd.com>, "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>,
 "Tao, Yintian" <Yintian.Tao@amd.com>, "Min, Frank" <Frank.Min@amd.com>, "Liu, 
 Monk" <Monk.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] amd/amdgpu/sriov enable onevf mode for ARCTURUS VF
Thread-Topic: [PATCH 1/2] amd/amdgpu/sriov enable onevf mode for ARCTURUS VF
Thread-Index: AQHVvILjY/76J6Fubkq2JqpFQ/7eDKfNjYGwgAAHNcCAAATZkA==
Date: Fri, 27 Dec 2019 08:08:49 +0000
Message-ID: <CH2PR12MB36725F4405EA749A89712BDFBB2A0@CH2PR12MB3672.namprd12.prod.outlook.com>
References: <20191227065710.3261-1-Jack.Zhang1@amd.com>
 <CH2PR12MB3672D8C9F4D961F505205481BB2A0@CH2PR12MB3672.namprd12.prod.outlook.com>
 <MN2PR12MB2975973D777DFC485A7A330E8F2A0@MN2PR12MB2975.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB2975973D777DFC485A7A330E8F2A0@MN2PR12MB2975.namprd12.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2019-12-27T07:26:45Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=d845633d-cefd-4db6-a908-0000369a550a;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Jack.Zhang1@amd.com; 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a9593aff-7a02-492b-b91a-08d78aa4016b
x-ms-traffictypediagnostic: CH2PR12MB3909:|CH2PR12MB3909:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB3909FF86DA392520BCAD3BE1BB2A0@CH2PR12MB3909.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0264FEA5C3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(136003)(366004)(39860400002)(13464003)(199004)(189003)(66574012)(110136005)(316002)(8676002)(5660300002)(8936002)(81166006)(81156014)(478600001)(55016002)(9686003)(52536014)(86362001)(2906002)(33656002)(19627235002)(6506007)(66446008)(66476007)(66556008)(64756008)(186003)(66946007)(71200400001)(7696005)(53546011)(66616009)(76116006)(26005)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3909;
 H:CH2PR12MB3672.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ko4tSKMMG9eaE45vMwJNK2CULqubkIrj30QsAuryAFZvQiC4OSgDr2rr3DUOlp8tQOAYdIf4dcvzDhUHgKDTPHXDMBinVJKOYZvLJAVGopc/fOHvxt7ALr6zdsc0VkvxNagG68+4QYLr41cqKNso1UN5MqUfpDQkj7+qq3sRZ85IRNdiA18YWbCIC3W+e2qJwEytq5HPYbBoOgj3RyEF/53NTj4VCCtFcUaZmkfGDPn0jOoRuwTp1Gm9ERPUpSzy15Um2oJMhO72kOps24eGSM+f10SMK3pj4S3jXyaxbwQ60QQxWh21H7EKRCQ2sLTFhsSRN73gzWyxFfUbd3yROEjHYCBd6oEwDgf5TSaVkekkYI+20h+4wLPV6S7V6ZDQN8Wa6Z6mHO6/6dk5786KnFsyoIkjHQPG3ccke2L4/jzhOPQVJoX7AwnC43Boxf6EBotw1uTwK9vUrdcHhQiUMA+1jC4sYyBjIE7ddilKIYfSYzjAd2E5CdhZO3zinNh3x91z0jxN/BCR/OJW8q1Zkg==
Content-Type: multipart/mixed;
 boundary="_002_CH2PR12MB36725F4405EA749A89712BDFBB2A0CH2PR12MB3672namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9593aff-7a02-492b-b91a-08d78aa4016b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2019 08:08:49.8561 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ND75WsVw6Rq+4J9Zy8lZTpi2fJJRDwIyJ5vH/C5lsHSJqX9c/PZUr7GzHev63Auz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3909
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--_002_CH2PR12MB36725F4405EA749A89712BDFBB2A0CH2PR12MB3672namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

aGksIEVtaWx5LA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3Lg0KQ29tbWVudCBpbmxpbmUs
IHVwZGF0ZWQgcGF0Y2ggYXR0YWNoZWQNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZy
b206IERlbmcsIEVtaWx5IDxFbWlseS5EZW5nQGFtZC5jb20+IA0KU2VudDogRnJpZGF5LCBEZWNl
bWJlciAyNywgMjAxOSAzOjI3IFBNDQpUbzogWmhhbmcsIEphY2sgKEppYW4pIDxKYWNrLlpoYW5n
MUBhbWQuY29tPjsgRmVuZywgS2VubmV0aCA8S2VubmV0aC5GZW5nQGFtZC5jb20+OyBEZXVjaGVy
LCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBRdWFuLCBFdmFuIDxFdmFu
LlF1YW5AYW1kLmNvbT47IFdhbmcsIEtldmluKFlhbmcpIDxLZXZpbjEuV2FuZ0BhbWQuY29tPjsg
VGFvLCBZaW50aWFuIDxZaW50aWFuLlRhb0BhbWQuY29tPjsgTWluLCBGcmFuayA8RnJhbmsuTWlu
QGFtZC5jb20+OyBMaXUsIE1vbmsgPE1vbmsuTGl1QGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KU3ViamVjdDogUkU6IFtQQVRDSCAxLzJdIGFtZC9hbWRncHUvc3Jpb3Yg
ZW5hYmxlIG9uZXZmIG1vZGUgZm9yIEFSQ1RVUlVTIFZGDQoNCltBTUQgT2ZmaWNpYWwgVXNlIE9u
bHkgLSBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0NCg0KDQoNCj4tLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPkZyb206IFpoYW5nLCBKYWNrIChKaWFuKSA8SmFjay5aaGFuZzFAYW1kLmNv
bT4NCj5TZW50OiBGcmlkYXksIERlY2VtYmVyIDI3LCAyMDE5IDM6MDAgUE0NCj5UbzogRmVuZywg
S2VubmV0aCA8S2VubmV0aC5GZW5nQGFtZC5jb20+OyBEZXVjaGVyLCBBbGV4YW5kZXIgDQo+PEFs
ZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBRdWFuLCBFdmFuIDxFdmFuLlF1YW5AYW1kLmNvbT47
IFdhbmcsDQo+S2V2aW4oWWFuZykgPEtldmluMS5XYW5nQGFtZC5jb20+OyBUYW8sIFlpbnRpYW4g
PFlpbnRpYW4uVGFvQGFtZC5jb20+OyANCj5EZW5nLCBFbWlseSA8RW1pbHkuRGVuZ0BhbWQuY29t
PjsgTWluLCBGcmFuayA8RnJhbmsuTWluQGFtZC5jb20+OyBMaXUsIA0KPk1vbmsgPE1vbmsuTGl1
QGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgWmhhbmcsIEphY2sgDQo+
KEppYW4pIDxKYWNrLlpoYW5nMUBhbWQuY29tPg0KPlN1YmplY3Q6IFJFOiBbUEFUQ0ggMS8yXSBh
bWQvYW1kZ3B1L3NyaW92IGVuYWJsZSBvbmV2ZiBtb2RlIGZvciANCj5BUkNUVVJVUyBWRg0KPg0K
Pg0KPg0KPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogSmFjayBaaGFuZyA8SmFj
ay5aaGFuZzFAYW1kLmNvbT4NCj5TZW50OiBGcmlkYXksIERlY2VtYmVyIDI3LCAyMDE5IDI6NTcg
UE0NCj5UbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj5DYzogWmhhbmcsIEphY2sg
KEppYW4pIDxKYWNrLlpoYW5nMUBhbWQuY29tPg0KPlN1YmplY3Q6IFtQQVRDSCAxLzJdIGFtZC9h
bWRncHUvc3Jpb3YgZW5hYmxlIG9uZXZmIG1vZGUgZm9yIEFSQ1RVUlVTIFZGDQo+DQo+QmVmb3Jl
LCBpbml0aWFsaXphdGlvbiBvZiBzbXUgaXAgYmxvY2sgd291bGQgYmUgc2tpcHBlZCBmb3Igc3Jp
b3YgDQo+QVNJQ3MuIEJ1dCBpZiB0aGVyZSdzIG9ubHkgb25lIFZGIGJlaW5nIHVzZWQsIGd1ZXN0
IGRyaXZlciBzaG91bGQgYmUgDQo+YWJsZSB0byBkdW1wIHNvbWUgSFcgaW5mbyBzdWNoIGFzIGNs
a3MsIHRlbXBlcmF0dXJlLGV0Yy4NCj4NCj5UbyBzb2x2ZSB0aGlzLCBub3cgYWZ0ZXIgb25ldmYg
bW9kZSBpcyBlbmFibGVkLCBob3N0IGRyaXZlciB3aWxsIG5vdGlmeSANCj5ndWVzdC4gSWYgaXQn
cyBvbmV2ZiBtb2RlLCBndWVzdCB3aWxsIGRvIHNtdSBod19pbml0IGFuZCBza2lwIHNvbWUgDQo+
c3RlcHMgaW4gbm9ybWFsIHNtdSBod19pbml0IGZsb3cgYmVjYXVzZSBob3N0IGRyaXZlciBoYXMg
YWxyZWFkeSBkb25lIGl0IGZvciBzbXUuDQo+DQo+V2l0aCB0aGlzIGZpeCwgZ3Vlc3QgYXBwIGNh
biB0YWxrIHdpdGggc211IGFuZCBkdW1wIGh3IGluZm9ybWF0aW9uIGZyb20gc211Lg0KPg0KPnYy
OiByZWZpbmUgdGhlIGxvZ2ljIGZvciBwbV9lbmFibGVkLlNraXAgaHdfaW5pdCBieSBub3QgY2hh
bmdpbmcgcG1fZW5hYmxlZC4NCj4NCj5TaWduZWQtb2ZmLWJ5OiBKYWNrIFpoYW5nIDxKYWNrLlpo
YW5nMUBhbWQuY29tPg0KPi0tLQ0KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cHNwLmMgICAgfCAgMyArLQ0KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jICAg
ICAgICAgfCAgMyArLQ0KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211
LmMgfCA0NSANCj4rKysrKysrKysrKysrKysrKy0tLS0tLQ0KPi0tLS0tLS0NCj4gMyBmaWxlcyBj
aGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkNCj4NCj5kaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jDQo+Yi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMNCj5pbmRleCA4NDY5ODM0Li4wODEzMGE2IDEw
MDY0NA0KPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYw0KPisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYw0KPkBAIC0xNDQ4LDcg
KzE0NDgsOCBAQCBzdGF0aWMgaW50IHBzcF9ucF9md19sb2FkKHN0cnVjdCBwc3BfY29udGV4dCAq
cHNwKQ0KPiAgICAgICAgICAgICAgICAgICAgIHx8IHVjb2RlLT51Y29kZV9pZCA9PSBBTURHUFVf
VUNPREVfSURfUkxDX0cNCj4gCSAgICAgICAgICAgIHx8IHVjb2RlLT51Y29kZV9pZCA9PQ0KPkFN
REdQVV9VQ09ERV9JRF9STENfUkVTVE9SRV9MSVNUX0NOVEwNCj4gCSAgICAgICAgICAgIHx8IHVj
b2RlLT51Y29kZV9pZCA9PQ0KPkFNREdQVV9VQ09ERV9JRF9STENfUkVTVE9SRV9MSVNUX0dQTV9N
RU0NCj4tCSAgICAgICAgICAgIHx8IHVjb2RlLT51Y29kZV9pZCA9PQ0KPkFNREdQVV9VQ09ERV9J
RF9STENfUkVTVE9SRV9MSVNUX1NSTV9NRU0pKQ0KPisJICAgICAgICAgICAgfHwgdWNvZGUtPnVj
b2RlX2lkID09DQo+QU1ER1BVX1VDT0RFX0lEX1JMQ19SRVNUT1JFX0xJU1RfU1JNX01FTQ0KPisJ
ICAgICAgICAgICAgfHwgdWNvZGUtPnVjb2RlX2lkID09IEFNREdQVV9VQ09ERV9JRF9TTUMpKQ0K
PiAJCQkvKnNraXAgdWNvZGUgbG9hZGluZyBpbiBTUklPViBWRiAqLw0KPiAJCQljb250aW51ZTsN
Cj4NCj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYw0KPmIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYw0KPmluZGV4IGI1M2Q0MDEuLmEyNzE0
OTYgMTAwNjQ0DQo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYw0KPisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMNCj5AQCAtODI3LDggKzgyNyw3
IEBAIGludCBzb2MxNV9zZXRfaXBfYmxvY2tzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0K
PiAJCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LA0KPiZkY2VfdmlydHVhbF9pcF9i
bG9jayk7DQo+IAkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJmdmeF92OV8wX2lw
X2Jsb2NrKTsNCj4gCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmc2RtYV92NF8w
X2lwX2Jsb2NrKTsNCj4tCQlpZiAoIWFtZGdwdV9zcmlvdl92ZihhZGV2KSkNCj4tCQkJYW1kZ3B1
X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwNCj4mc211X3YxMV8wX2lwX2Jsb2NrKTsNCj4rCQlh
bWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmc211X3YxMV8wX2lwX2Jsb2NrKTsNCj4N
Cj4gCQlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKSB7DQo+IAkJCWlmIChsaWtlbHkoYWRldi0+
ZmlybXdhcmUubG9hZF90eXBlID09DQo+QU1ER1BVX0ZXX0xPQURfUFNQKSkgZGlmZiAtLWdpdA0K
PmEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jDQo+Yi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMNCj5pbmRleCA5MzZjNjgyLi40MmMw
YTZkIDEwMDY0NA0KPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9z
bXUuYw0KPisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYw0K
PkBAIC01MzEsMTAgKzUzMSwxNCBAQCBib29sIGlzX3N1cHBvcnRfc3dfc211KHN0cnVjdCBhbWRn
cHVfZGV2aWNlDQo+KmFkZXYpDQo+IAlpZiAoYWRldi0+YXNpY190eXBlID09IENISVBfVkVHQTIw
KQ0KPiAJCXJldHVybiAoYW1kZ3B1X2RwbSA9PSAyKSA/IHRydWUgOiBmYWxzZTsNCj4gCWVsc2Ug
aWYgKGFkZXYtPmFzaWNfdHlwZSA+PSBDSElQX0FSQ1RVUlVTKSB7DQo+LQkJaWYgKGFtZGdwdV9z
cmlvdl92ZihhZGV2KSkNCj4tCQkJcmV0dXJuIGZhbHNlOw0KPi0JCWVsc2UNCj4rCQlpZiAoYW1k
Z3B1X3NyaW92X3ZmKGFkZXYpKSB7DQo+KwkJCWlmKGFtZGdwdV9zcmlvdl9pc19wcF9vbmVfdmYo
YWRldikpDQo+KwkJCQlyZXR1cm4gdHJ1ZTsNCj4rCQkJZWxzZQ0KPisJCQkJcmV0dXJuIGZhbHNl
Ow0KPisJCX0gZWxzZSB7DQo+IAkJCXJldHVybiB0cnVlOw0KPisJCX0NCj4gCX0gZWxzZQ0KPiAJ
CXJldHVybiBmYWxzZTsNCj4gfQ0KPkBAIC0xMDYyLDIwICsxMDY2LDE5IEBAIHN0YXRpYyBpbnQg
c211X3NtY190YWJsZV9od19pbml0KHN0cnVjdCANCj5zbXVfY29udGV4dCAqc211LA0KPiAJfQ0K
Pg0KPiAJLyogc211X2R1bXBfcHB0YWJsZShzbXUpOyAqLw0KPisJaWYoYW1kZ3B1X3NyaW92X3Zm
KGFkZXYpICYmICFhbWRncHVfc3Jpb3ZfaXNfcHBfb25lX3ZmKGFkZXYpKXsNCj4rCQkvKg0KPisJ
CSAqIENvcHkgcHB0YWJsZSBibyBpbiB0aGUgdnJhbSB0byBzbWMgd2l0aCBTTVUgTVNHcyBzdWNo
IGFzDQo+KwkJICogU2V0RHJpdmVyRHJhbUFkZHIgYW5kIFRyYW5zZmVyVGFibGVEcmFtMlNtdS4N
Cj4rCQkgKi8NCj4rCQlyZXQgPSBzbXVfd3JpdGVfcHB0YWJsZShzbXUpOw0KPisJCWlmIChyZXQp
DQo+KwkJCXJldHVybiByZXQ7DQpbRW1pbHldV2h5IG9ubHkgc3Jpb3YgYW5kIG5vbiBvbmUgdmYg
bW9kZSBuZWVkIHRvIHRoaXM/IFdoYXQgYWJvdXQgYmFyZSBtZXRhbD8NCltKYWNrXSBjaGFuZ2Vk
IHRvICJpZighYW1kZ3B1X3NyaW92X3ZmKGFkZXYpIHx8ICFhbWRncHVfc3Jpb3ZfaXNfcHBfb25l
X3ZmKGFkZXYpKSINCj4NCj4tCS8qDQo+LQkgKiBDb3B5IHBwdGFibGUgYm8gaW4gdGhlIHZyYW0g
dG8gc21jIHdpdGggU01VIE1TR3Mgc3VjaCBhcw0KPi0JICogU2V0RHJpdmVyRHJhbUFkZHIgYW5k
IFRyYW5zZmVyVGFibGVEcmFtMlNtdS4NCj4tCSAqLw0KPi0JcmV0ID0gc211X3dyaXRlX3BwdGFi
bGUoc211KTsNCj4tCWlmIChyZXQpDQo+LQkJcmV0dXJuIHJldDsNCj4tDQo+LQkvKiBpc3N1ZSBS
dW4qQnRjIG1zZyAqLw0KPi0JcmV0ID0gc211X3J1bl9idGMoc211KTsNCj4tCWlmIChyZXQpDQo+
LQkJcmV0dXJuIHJldDsNCj4tDQo+KwkJLyogaXNzdWUgUnVuKkJ0YyBtc2cgKi8NCj4rCQlyZXQg
PSBzbXVfcnVuX2J0YyhzbXUpOw0KPisJCWlmIChyZXQpDQo+KwkJCXJldHVybiByZXQ7DQo+IAly
ZXQgPSBzbXVfZmVhdHVyZV9zZXRfYWxsb3dlZF9tYXNrKHNtdSk7DQo+IAlpZiAocmV0KQ0KPiAJ
CXJldHVybiByZXQ7DQo+QEAgLTEwODMsNyArMTA4Niw3IEBAIHN0YXRpYyBpbnQgc211X3NtY190
YWJsZV9od19pbml0KHN0cnVjdCANCj5zbXVfY29udGV4dCAqc211LA0KPiAJcmV0ID0gc211X3N5
c3RlbV9mZWF0dXJlc19jb250cm9sKHNtdSwgdHJ1ZSk7DQo+IAlpZiAocmV0KQ0KPiAJCXJldHVy
biByZXQ7DQo+LQ0KPisJfQ0KPiAJaWYgKGFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX0FSQ1RVUlVT
KSB7DQo+IAkJcmV0ID0gc211X25vdGlmeV9kaXNwbGF5X2NoYW5nZShzbXUpOw0KPiAJCWlmIChy
ZXQpDQo+QEAgLTExMzYsOCArMTEzOSw5IEBAIHN0YXRpYyBpbnQgc211X3NtY190YWJsZV9od19p
bml0KHN0cnVjdCANCj5zbXVfY29udGV4dCAqc211LA0KPiAJLyoNCj4gCSAqIFNldCBQTVNUQVRV
U0xPRyB0YWJsZSBibyBhZGRyZXNzIHdpdGggU2V0VG9vbHNEcmFtQWRkciBNU0cgZm9yIA0KPnRv
b2xzLg0KPiAJICovDQo+LQlyZXQgPSBzbXVfc2V0X3Rvb2xfdGFibGVfbG9jYXRpb24oc211KTsN
Cj4tDQo+KwlpZihhbWRncHVfc3Jpb3ZfdmYoYWRldikgJiYgIWFtZGdwdV9zcmlvdl9pc19wcF9v
bmVfdmYoYWRldikpew0KPisJCXJldCA9IHNtdV9zZXRfdG9vbF90YWJsZV9sb2NhdGlvbihzbXUp
Ow0KPisJfQ0KPiAJaWYgKCFzbXVfaXNfZHBtX3J1bm5pbmcoc211KSkNCj4gCQlwcl9pbmZvKCJk
cG0gaGFzIGJlZW4gZGlzYWJsZWRcbiIpOw0KPg0KPkBAIC0xMjQ5LDYgKzEyNTMsOSBAQCBzdGF0
aWMgaW50IHNtdV9od19pbml0KHZvaWQgKmhhbmRsZSkNCj4gCQlzbXVfc2V0X2dmeF9jZ3BnKCZh
ZGV2LT5zbXUsIHRydWUpOw0KPiAJfQ0KPg0KPisJaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSYm
ICFhbWRncHVfc3Jpb3ZfaXNfcHBfb25lX3ZmKGFkZXYpKQ0KPisJCXJldHVybiAwOw0KPisNCj4g
CWlmICghc211LT5wbV9lbmFibGVkKQ0KPiAJCXJldHVybiAwOw0KPg0KPi0tDQo+Mi43LjQNCg==

--_002_CH2PR12MB36725F4405EA749A89712BDFBB2A0CH2PR12MB3672namp_
Content-Type: application/octet-stream;
	name="0001-amd-amdgpu-sriov-enable-onevf-mode-for-ARCTURUS-VF.patch"
Content-Description:  0001-amd-amdgpu-sriov-enable-onevf-mode-for-ARCTURUS-VF.patch
Content-Disposition: attachment;
	filename="0001-amd-amdgpu-sriov-enable-onevf-mode-for-ARCTURUS-VF.patch";
	size=4894; creation-date="Fri, 27 Dec 2019 08:08:06 GMT";
	modification-date="Fri, 27 Dec 2019 08:08:06 GMT"
Content-Transfer-Encoding: base64

RnJvbSBkNzEzMmE5YzNjNTcwMDA3ZjFjYzI0Yjk1MGYwODE4YzUwNzkyYjIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKYWNrIFpoYW5nIDxKYWNrLlpoYW5nMUBhbWQuY29tPgpEYXRl
OiBUdWUsIDEwIERlYyAyMDE5IDEwOjUxOjAxICswODAwClN1YmplY3Q6IFtQQVRDSCAxLzJdIGFt
ZC9hbWRncHUvc3Jpb3YgZW5hYmxlIG9uZXZmIG1vZGUgZm9yIEFSQ1RVUlVTIFZGCgpCZWZvcmUs
IGluaXRpYWxpemF0aW9uIG9mIHNtdSBpcCBibG9jayB3b3VsZCBiZSBza2lwcGVkCmZvciBzcmlv
diBBU0lDcy4gQnV0IGlmIHRoZXJlJ3Mgb25seSBvbmUgVkYgYmVpbmcgdXNlZCwKZ3Vlc3QgZHJp
dmVyIHNob3VsZCBiZSBhYmxlIHRvIGR1bXAgc29tZSBIVyBpbmZvIHN1Y2ggYXMKY2xrcywgdGVt
cGVyYXR1cmUsZXRjLgoKVG8gc29sdmUgdGhpcywgbm93IGFmdGVyIG9uZXZmIG1vZGUgaXMgZW5h
YmxlZCwgaG9zdApkcml2ZXIgd2lsbCBub3RpZnkgZ3Vlc3QuIElmIGl0J3Mgb25ldmYgbW9kZSwg
Z3Vlc3Qgd2lsbApkbyBzbXUgaHdfaW5pdCBhbmQgc2tpcCBzb21lIHN0ZXBzIGluIG5vcm1hbCBz
bXUgaHdfaW5pdApmbG93IGJlY2F1c2UgaG9zdCBkcml2ZXIgaGFzIGFscmVhZHkgZG9uZSBpdCBm
b3Igc211LgoKV2l0aCB0aGlzIGZpeCwgZ3Vlc3QgYXBwIGNhbiB0YWxrIHdpdGggc211IGFuZCBk
dW1wIGh3CmluZm9ybWF0aW9uIGZyb20gc211LgoKdjI6IHJlZmluZSB0aGUgbG9naWMgZm9yIHBt
X2VuYWJsZWQuU2tpcCBod19pbml0IGJ5IG5vdApjaGFuZ2luZyBwbV9lbmFibGVkLgoKU2lnbmVk
LW9mZi1ieTogSmFjayBaaGFuZyA8SmFjay5aaGFuZzFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMgICAgfCAgMyArLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvc29jMTUuYyAgICAgICAgIHwgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2FtZGdwdV9zbXUuYyB8IDQ1ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LQogMyBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMKaW5kZXggODQ2OTgzNC4uMDgxMzBh
NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYwpAQCAtMTQ0OCw3ICsx
NDQ4LDggQEAgc3RhdGljIGludCBwc3BfbnBfZndfbG9hZChzdHJ1Y3QgcHNwX2NvbnRleHQgKnBz
cCkKICAgICAgICAgICAgICAgICAgICAgfHwgdWNvZGUtPnVjb2RlX2lkID09IEFNREdQVV9VQ09E
RV9JRF9STENfRwogCSAgICAgICAgICAgIHx8IHVjb2RlLT51Y29kZV9pZCA9PSBBTURHUFVfVUNP
REVfSURfUkxDX1JFU1RPUkVfTElTVF9DTlRMCiAJICAgICAgICAgICAgfHwgdWNvZGUtPnVjb2Rl
X2lkID09IEFNREdQVV9VQ09ERV9JRF9STENfUkVTVE9SRV9MSVNUX0dQTV9NRU0KLQkgICAgICAg
ICAgICB8fCB1Y29kZS0+dWNvZGVfaWQgPT0gQU1ER1BVX1VDT0RFX0lEX1JMQ19SRVNUT1JFX0xJ
U1RfU1JNX01FTSkpCisJICAgICAgICAgICAgfHwgdWNvZGUtPnVjb2RlX2lkID09IEFNREdQVV9V
Q09ERV9JRF9STENfUkVTVE9SRV9MSVNUX1NSTV9NRU0KKwkgICAgICAgICAgICB8fCB1Y29kZS0+
dWNvZGVfaWQgPT0gQU1ER1BVX1VDT0RFX0lEX1NNQykpCiAJCQkvKnNraXAgdWNvZGUgbG9hZGlu
ZyBpbiBTUklPViBWRiAqLwogCQkJY29udGludWU7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2Mx
NS5jCmluZGV4IGI1M2Q0MDEuLmEyNzE0OTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3NvYzE1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUu
YwpAQCAtODI3LDggKzgyNyw3IEBAIGludCBzb2MxNV9zZXRfaXBfYmxvY2tzKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KQogCQkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJmRj
ZV92aXJ0dWFsX2lwX2Jsb2NrKTsKIAkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwg
JmdmeF92OV8wX2lwX2Jsb2NrKTsKIAkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwg
JnNkbWFfdjRfMF9pcF9ibG9jayk7Ci0JCWlmICghYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKQotCQkJ
YW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnNtdV92MTFfMF9pcF9ibG9jayk7CisJ
CWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZzbXVfdjExXzBfaXBfYmxvY2spOwog
CiAJCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikpIHsKIAkJCWlmIChsaWtlbHkoYWRldi0+Zmly
bXdhcmUubG9hZF90eXBlID09IEFNREdQVV9GV19MT0FEX1BTUCkpCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKaW5kZXggOTM2YzY4Mi4uNDk5MTdlMiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwpAQCAtNTMxLDEwICs1MzEs
MTQgQEAgYm9vbCBpc19zdXBwb3J0X3N3X3NtdShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikK
IAlpZiAoYWRldi0+YXNpY190eXBlID09IENISVBfVkVHQTIwKQogCQlyZXR1cm4gKGFtZGdwdV9k
cG0gPT0gMikgPyB0cnVlIDogZmFsc2U7CiAJZWxzZSBpZiAoYWRldi0+YXNpY190eXBlID49IENI
SVBfQVJDVFVSVVMpIHsKLQkJaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSkKLQkJCXJldHVybiBm
YWxzZTsKLQkJZWxzZQorCQlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKSB7CisJCQlpZihhbWRn
cHVfc3Jpb3ZfaXNfcHBfb25lX3ZmKGFkZXYpKQorCQkJCXJldHVybiB0cnVlOworCQkJZWxzZQor
CQkJCXJldHVybiBmYWxzZTsKKwkJfSBlbHNlIHsKIAkJCXJldHVybiB0cnVlOworCQl9CiAJfSBl
bHNlCiAJCXJldHVybiBmYWxzZTsKIH0KQEAgLTEwNjIsMjAgKzEwNjYsMTkgQEAgc3RhdGljIGlu
dCBzbXVfc21jX3RhYmxlX2h3X2luaXQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJfQogCiAJ
Lyogc211X2R1bXBfcHB0YWJsZShzbXUpOyAqLworCWlmICghYW1kZ3B1X3NyaW92X3ZmKGFkZXYp
IHx8ICFhbWRncHVfc3Jpb3ZfaXNfcHBfb25lX3ZmKGFkZXYpKSB7CisJCS8qCisJCSAqIENvcHkg
cHB0YWJsZSBibyBpbiB0aGUgdnJhbSB0byBzbWMgd2l0aCBTTVUgTVNHcyBzdWNoIGFzCisJCSAq
IFNldERyaXZlckRyYW1BZGRyIGFuZCBUcmFuc2ZlclRhYmxlRHJhbTJTbXUuCisJCSAqLworCQly
ZXQgPSBzbXVfd3JpdGVfcHB0YWJsZShzbXUpOworCQlpZiAocmV0KQorCQkJcmV0dXJuIHJldDsK
IAotCS8qCi0JICogQ29weSBwcHRhYmxlIGJvIGluIHRoZSB2cmFtIHRvIHNtYyB3aXRoIFNNVSBN
U0dzIHN1Y2ggYXMKLQkgKiBTZXREcml2ZXJEcmFtQWRkciBhbmQgVHJhbnNmZXJUYWJsZURyYW0y
U211LgotCSAqLwotCXJldCA9IHNtdV93cml0ZV9wcHRhYmxlKHNtdSk7Ci0JaWYgKHJldCkKLQkJ
cmV0dXJuIHJldDsKLQotCS8qIGlzc3VlIFJ1bipCdGMgbXNnICovCi0JcmV0ID0gc211X3J1bl9i
dGMoc211KTsKLQlpZiAocmV0KQotCQlyZXR1cm4gcmV0OwotCisJCS8qIGlzc3VlIFJ1bipCdGMg
bXNnICovCisJCXJldCA9IHNtdV9ydW5fYnRjKHNtdSk7CisJCWlmIChyZXQpCisJCQlyZXR1cm4g
cmV0OwogCXJldCA9IHNtdV9mZWF0dXJlX3NldF9hbGxvd2VkX21hc2soc211KTsKIAlpZiAocmV0
KQogCQlyZXR1cm4gcmV0OwpAQCAtMTA4Myw3ICsxMDg2LDcgQEAgc3RhdGljIGludCBzbXVfc21j
X3RhYmxlX2h3X2luaXQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJcmV0ID0gc211X3N5c3Rl
bV9mZWF0dXJlc19jb250cm9sKHNtdSwgdHJ1ZSk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsK
LQorCX0KIAlpZiAoYWRldi0+YXNpY190eXBlICE9IENISVBfQVJDVFVSVVMpIHsKIAkJcmV0ID0g
c211X25vdGlmeV9kaXNwbGF5X2NoYW5nZShzbXUpOwogCQlpZiAocmV0KQpAQCAtMTEzNiw4ICsx
MTM5LDkgQEAgc3RhdGljIGludCBzbXVfc21jX3RhYmxlX2h3X2luaXQoc3RydWN0IHNtdV9jb250
ZXh0ICpzbXUsCiAJLyoKIAkgKiBTZXQgUE1TVEFUVVNMT0cgdGFibGUgYm8gYWRkcmVzcyB3aXRo
IFNldFRvb2xzRHJhbUFkZHIgTVNHIGZvciB0b29scy4KIAkgKi8KLQlyZXQgPSBzbXVfc2V0X3Rv
b2xfdGFibGVfbG9jYXRpb24oc211KTsKLQorCWlmICghYW1kZ3B1X3NyaW92X3ZmKGFkZXYpIHx8
ICFhbWRncHVfc3Jpb3ZfaXNfcHBfb25lX3ZmKGFkZXYpKSB7CisJCXJldCA9IHNtdV9zZXRfdG9v
bF90YWJsZV9sb2NhdGlvbihzbXUpOworCX0KIAlpZiAoIXNtdV9pc19kcG1fcnVubmluZyhzbXUp
KQogCQlwcl9pbmZvKCJkcG0gaGFzIGJlZW4gZGlzYWJsZWRcbiIpOwogCkBAIC0xMjQ5LDYgKzEy
NTMsOSBAQCBzdGF0aWMgaW50IHNtdV9od19pbml0KHZvaWQgKmhhbmRsZSkKIAkJc211X3NldF9n
ZnhfY2dwZygmYWRldi0+c211LCB0cnVlKTsKIAl9CiAKKwlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFk
ZXYpICYmICFhbWRncHVfc3Jpb3ZfaXNfcHBfb25lX3ZmKGFkZXYpKQorCQlyZXR1cm4gMDsKKwog
CWlmICghc211LT5wbV9lbmFibGVkKQogCQlyZXR1cm4gMDsKIAotLSAKMi43LjQKCg==

--_002_CH2PR12MB36725F4405EA749A89712BDFBB2A0CH2PR12MB3672namp_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_002_CH2PR12MB36725F4405EA749A89712BDFBB2A0CH2PR12MB3672namp_--
