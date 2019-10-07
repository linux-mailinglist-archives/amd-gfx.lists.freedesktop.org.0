Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 876C1CEC10
	for <lists+amd-gfx@lfdr.de>; Mon,  7 Oct 2019 20:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB556E160;
	Mon,  7 Oct 2019 18:41:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810089.outbound.protection.outlook.com [40.107.81.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A886E167
 for <amd-gfx@lists.freedesktop.org>; Mon,  7 Oct 2019 18:41:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GE5H2z1S5F0g7yRLQD6ORDWI0sD5SZwtZTMrRtO9226zIQolU+GYYtLsd4k1nzcl2Gr8W8JEyX2TXc38u+ic7P2F4uC6GylkotaL5XCyQrM4xJnMonc27Hvc66m4l2W17jiEP3P/DlMRmPeVPKVH/aeM1xlkKI63moGx2BX9MurqmIq6GYRcGnUZtGAZNgTW/McScE6mvzZOIbKdJzvTD0nB/gEC5RugLzVCjhc5uav1MwrFQXx55izeujLZpUj4jpcId6PcmfNJwqBJdlNfsT426io3LMN9XNhBhcE03H06kMt3wb05awx1YgaDhwArHvWNdTjVeEtFWePv7BarXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kST/LvSSl+uLt3hoIvWQgVaGVlkXdvad7fy4TEq6mXg=;
 b=YolnPftZMYlG2nLkTDAgxLcHGg7n0e1HIZ4oVrSnyGH1OMbGkk0yuzP0/LoK9DbZUmaGeq45CwAfyxw3ldU2SSCpSJOFMJZFZhVeVP0ht072BR0rCDIMQvFgPtPmfiKkXXvhTajpQNUEfgS35qY3bag0tbx4N8tEbJVR9wUbv2TcjFIq0aVHLRnwpEcPIlnghIMmBuhEQgUtU02hDkmfXeupBc+ygRm2nlPa4IxZzcsS3CNYs9VaPJShJWjibk+PjXteQcSW2sjjYrnreny9yqcaQHwgoKaeHZog3qkyS0o9+ED9veSTHA9t7lOLtMnbCLySIh/fUNWxUiWisaaFtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3339.namprd12.prod.outlook.com (20.178.31.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 18:41:36 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::e56a:1c63:d6bd:8034]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::e56a:1c63:d6bd:8034%4]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 18:41:36 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: fix the build when CIK support is disabled
Thread-Topic: [PATCH] drm/amdkfd: fix the build when CIK support is disabled
Thread-Index: AQHVer418Pq5hc/Eu0ep8fFOmPCpTadPiDMA
Date: Mon, 7 Oct 2019 18:41:35 +0000
Message-ID: <0ad550c1-c45c-89d7-7f0b-d348a0943939@amd.com>
References: <20191004141529.5342-1-alexander.deucher@amd.com>
In-Reply-To: <20191004141529.5342-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTBPR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::42) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 076646b7-83b8-4272-4be2-08d74b55fb61
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3339:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3339E7A4FCD16A54F00D235B929B0@DM6PR12MB3339.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(199004)(189003)(476003)(2616005)(486006)(14454004)(446003)(11346002)(58126008)(316002)(305945005)(81156014)(81166006)(7736002)(8936002)(2501003)(229853002)(8676002)(6512007)(110136005)(65806001)(6486002)(65956001)(66066001)(6436002)(36756003)(31696002)(86362001)(66446008)(53546011)(102836004)(26005)(186003)(478600001)(6506007)(386003)(52116002)(76176011)(25786009)(6246003)(4326008)(66476007)(99286004)(64756008)(14444005)(256004)(66946007)(66556008)(5660300002)(71190400001)(71200400001)(3846002)(6116002)(2906002)(31686004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3339;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nbZgj9RvoONjxPcaerT9LNJUcLn9nHtnQik2GFapC5x+JK4E9vqBiXlzt2yLkrepSn0MKKWPPlZEFqks5NE291zY1C/5EZ2O5z30Eu6WUNyiy9mvFk5yvW5dyqZKx3AL5jz9Z2uX635eUUJ6X9FUR+g3DQCB8wnkG0cuexTZ316gZ9ruhTfP+VMfmgCWg3fN8hqb9subgd96DNuMdY2siFMVnoLbPLjWhrwToXxOhLBvWmhqGxPSakdeQz/RWokcQlgQ1g88w3FBkLDupmb206sg2yX9uJzCvUoPFwcHrDAByNPsJ7Z5Lodfg9N7SsEre/l5qy3FlRYG9KJRBgCV9Hyn6qhfuufDMJAZopNGXel+A4Wrjo2f4az8rgRhsLBrSr5+/7f82R+eGm1mf3Lg2i63gcOnThk95ih16AGZd38=
Content-ID: <9D5CAA75D6BD4A4283CD45B61D9B8DBE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 076646b7-83b8-4272-4be2-08d74b55fb61
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 18:41:36.0054 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jP31/fYOzLCWGbQK6B//xOfT5siCZ4MeMG/yrwCMYMHVruQoa6MqGhRwHV9aWhaGO+ciENbRVljO0hQmhow/9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3339
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kST/LvSSl+uLt3hoIvWQgVaGVlkXdvad7fy4TEq6mXg=;
 b=QOpwNiJkhvIZmoO3yEc9NdCDZl3JZDvtFck24PvIugK0GYWw5cTVTz3/hBqCXsUPxLbYxDoT+eNwygBF60XEjlRpH/inukzCSzjDg0eo+N1eRgguSUIAqqd1mJdSAn1Cuqi9jTGnLZ//3SzflRSmcmIKjMNONl9WGCGN7wBpLP0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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

T24gMjAxOS0xMC0wNCAxMDoxNSBhLm0uLCBBbGV4IERldWNoZXIgd3JvdGU6DQo+IEFkZCBwcm9w
ZXIgaWZkZWZzIGFyb3VuZCBDSUsgY29kZSBpbiBrZmQgc2V0dXAuDQo+DQo+IFNpZ25lZC1vZmYt
Ynk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCg0KUmV2aWV3ZWQt
Ynk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KDQpUaGFua3MhDQoN
Cj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jIHwgNiAr
KysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMNCj4gaW5kZXggMGRiMjczNTg3YWY0Li5kODk4
YWRmMjVmYmIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9k
ZXZpY2UuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMN
Cj4gQEAgLTM5LDcgKzM5LDkgQEANCj4gICAgKi8NCj4gICBzdGF0aWMgYXRvbWljX3Qga2ZkX2xv
Y2tlZCA9IEFUT01JQ19JTklUKDApOw0KPiAgIA0KPiArI2lmZGVmIENPTkZJR19EUk1fQU1ER1BV
X0NJSw0KPiAgIGV4dGVybiBjb25zdCBzdHJ1Y3Qga2ZkMmtnZF9jYWxscyBnZnhfdjdfa2ZkMmtn
ZDsNCj4gKyNlbmRpZg0KPiAgIGV4dGVybiBjb25zdCBzdHJ1Y3Qga2ZkMmtnZF9jYWxscyBnZnhf
djhfa2ZkMmtnZDsNCj4gICBleHRlcm4gY29uc3Qgc3RydWN0IGtmZDJrZ2RfY2FsbHMgZ2Z4X3Y5
X2tmZDJrZ2Q7DQo+ICAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBrZmQya2dkX2NhbGxzIGFyY3R1cnVz
X2tmZDJrZ2Q7DQo+IEBAIC00NywxMSArNDksMTUgQEAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBrZmQy
a2dkX2NhbGxzIGdmeF92MTBfa2ZkMmtnZDsNCj4gICANCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0
IGtmZDJrZ2RfY2FsbHMgKmtmZDJrZ2RfZnVuY3NbXSA9IHsNCj4gICAjaWZkZWYgS0ZEX1NVUFBP
UlRfSU9NTVVfVjINCj4gKyNpZmRlZiBDT05GSUdfRFJNX0FNREdQVV9DSUsNCj4gICAJW0NISVBf
S0FWRVJJXSA9ICZnZnhfdjdfa2ZkMmtnZCwNCj4gKyNlbmRpZg0KPiAgIAlbQ0hJUF9DQVJSSVpP
XSA9ICZnZnhfdjhfa2ZkMmtnZCwNCj4gICAJW0NISVBfUkFWRU5dID0gJmdmeF92OV9rZmQya2dk
LA0KPiAgICNlbmRpZg0KPiArI2lmZGVmIENPTkZJR19EUk1fQU1ER1BVX0NJSw0KPiAgIAlbQ0hJ
UF9IQVdBSUldID0gJmdmeF92N19rZmQya2dkLA0KPiArI2VuZGlmDQo+ICAgCVtDSElQX1RPTkdB
XSA9ICZnZnhfdjhfa2ZkMmtnZCwNCj4gICAJW0NISVBfRklKSV0gPSAmZ2Z4X3Y4X2tmZDJrZ2Qs
DQo+ICAgCVtDSElQX1BPTEFSSVMxMF0gPSAmZ2Z4X3Y4X2tmZDJrZ2QsDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
