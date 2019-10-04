Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D84F6CB56C
	for <lists+amd-gfx@lfdr.de>; Fri,  4 Oct 2019 09:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9B46EACD;
	Fri,  4 Oct 2019 07:41:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740049.outbound.protection.outlook.com [40.107.74.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E945F6EACD
 for <amd-gfx@lists.freedesktop.org>; Fri,  4 Oct 2019 07:41:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZC5UzVME4wwFLXII1ymVB9H0qhHMzg7DG7tUTOj7FticXseKeX3Y3iT587JrwMpaTnF39SPt0ALPEWhxyWptnAYhr4h5XXOnhBmrhug6HBXIb7USlEb/O9vcQY0x8e7ZPg2y5q+wLtykgKNvpzA26cNxc6c1eUPLr3lKUZBP3Tq7pkbvSZ1dkUBOtP4QLAJgx/wyPBDEvm31+lfLuLTp4wMO8G0+tuGKx8d9EliafxBTsUEIfDDOrXurnIkd1v0eDS7SOJRga8+BmHi1FzvegGBFhE3111Ta2/ZcoB6nQHMDESf1Z+T1eejp38fjvNFjwHEVXtfrFC3XECfn+qRnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YENx4y6pm8dQh+As5cA5tmOPOwTBK38bOF24OUc137Y=;
 b=k6xpxeHPNCLybTJX58P0sBTUFcfVzSymKw/y3c1uChJRoXg3857Q8LG6i59AJQwkNhCqft5TneKmzK6HIlXv+leTmSwLyuP8lTKAxxTpV70UomR04SOWEPfigBrBWGvKz20bfTWxaaK0dHMHZViCiiE88ywEwlu7SdaPY0k5xtsVcxC5oF5WLIZfLMepoK61Ohwd8c+7c7ZiYO23LyVcMKtiP2d3a83d/wnuSoR5DBu9Rhnp7n6dlJTx7ZpYg7AseJGzM9h1L+E7S2C7eoVG05I4+ps8WevZ0Uepi+m0ZtFqUtPa75CDi7ZBb1oaWmVkcqqF3065XiMqm4zH59hc1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1883.namprd12.prod.outlook.com (10.175.91.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.23; Fri, 4 Oct 2019 07:41:01 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::b016:c350:87e7:dede]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::b016:c350:87e7:dede%9]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 07:41:01 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Grodzovsky, 
 Andrey" <Andrey.Grodzovsky@amd.com>
Subject: RE: [PATCH 1/1] drm/amdgpu: Fix error handling in
 amdgpu_ras_recovery_init
Thread-Topic: [PATCH 1/1] drm/amdgpu: Fix error handling in
 amdgpu_ras_recovery_init
Thread-Index: AQHVejYBosupmZHMGEK9PdhWAuK0/6dKGUAw
Date: Fri, 4 Oct 2019 07:41:01 +0000
Message-ID: <DM5PR12MB14183C8B902DB114DC2152F6FC9E0@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <20191003220028.13107-1-Felix.Kuehling@amd.com>
In-Reply-To: <20191003220028.13107-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 006a72db-637a-41bc-477a-08d7489e342c
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1883:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB18833CD68604CCBF00B8987AFC9E0@DM5PR12MB1883.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:773;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(13464003)(189003)(199004)(76116006)(66946007)(66446008)(66556008)(486006)(64756008)(446003)(11346002)(476003)(14444005)(66476007)(6246003)(3846002)(256004)(229853002)(2906002)(6116002)(86362001)(6436002)(26005)(186003)(6306002)(66066001)(55016002)(102836004)(9686003)(53546011)(6506007)(4326008)(76176011)(8936002)(7696005)(316002)(99286004)(25786009)(6636002)(2501003)(52536014)(74316002)(5660300002)(14454004)(478600001)(71200400001)(71190400001)(966005)(110136005)(33656002)(7736002)(305945005)(81166006)(8676002)(81156014)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1883;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yhXdPxL8JxuS3IH3j1hALEeZB9Rx3C5pCcSZBW16Ws/W0pamdahXZyliteuKSSXXxPDcW4PCI4we5v4xwYYNBfolkwSCOJku94dIkHzhmUOwAc6jO4XjvedYhO96L9jle45Wyg3baNzzfSq+FcUC2rlZSEQRRwhhT+DEmEUttfdcNEtY1+c+Xo/6Mx8gqBmlT7nYVlTJfWqUsr1ccsL9EYctGdGOuaPhu3vqJ0C1bTEgy6/k7g40WOkj90X0HBFqBZUer45D0jZQVJUkCj6S3augamTsbc/On93rlLT5YNaD7XE11gi5iGf93mIO0JHIiVkHU6B9bmBbH2rKRDwPIplOBI2RjkoDWgGC6MlmJ9caQyHIvfjBTPiu4QNs0Kl1l+UPC35rYmTPYPKSTrAhjYzEDtxo4EePEMMKcSquksSxK01e0J0eXLpJVVnlTcvRQ5h7U1xBth7MY8chricPoA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 006a72db-637a-41bc-477a-08d7489e342c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 07:41:01.2964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hb5Ad8y9sTOwIgeMV3Hsdgxiuy7o8Fzmutzo6shrwssqbceTWlDhjrOYh/W+l02WpQfMdOgITAHxdcnQr3j2VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1883
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YENx4y6pm8dQh+As5cA5tmOPOwTBK38bOF24OUc137Y=;
 b=Bo8q8Ddqy54/WYw7s+wGHLxF8mwHPZNac6RpdeMzZPJ3m0aosD6hBV/jRABv39uNcxQUx/Amcrwtm4OdJEQ6yPtYnLO7oMg14L2VaVyWKQAKxW7BZ+A09goCZYHyToiu9RV+yMANiIW8SNcsztByzLbNiNwzNLlOslB0CCEDrwA=
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
Cc: "Cox, Philip" <Philip.Cox@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCg0KUmVn
YXJkcywNCkhhd2tpbmcNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4
IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgS3Vl
aGxpbmcsIEZlbGl4DQpTZW50OiAyMDE55bm0MTDmnIg05pelIDY6MDENClRvOiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZzsgR3JvZHpvdnNreSwgQW5kcmV5IDxBbmRyZXkuR3JvZHpvdnNr
eUBhbWQuY29tPg0KQ2M6IENveCwgUGhpbGlwIDxQaGlsaXAuQ294QGFtZC5jb20+DQpTdWJqZWN0
OiBbUEFUQ0ggMS8xXSBkcm0vYW1kZ3B1OiBGaXggZXJyb3IgaGFuZGxpbmcgaW4gYW1kZ3B1X3Jh
c19yZWNvdmVyeV9pbml0DQoNCkRvbid0IHNldCBhIHN0cnVjdCBwb2ludGVyIHRvIE5VTEwgYmVm
b3JlIGZyZWVpbmcgaXRzIG1lbWJlcnMuIEl0J3MgaGFyZCB0byBzZWUgd2hhdCdzIGhhcHBlbmlu
ZyBkdWUgdG8gYSBsb2NhbCBwb2ludGVyLXRvLXBvaW50ZXIgZGF0YSBhbGlhc2luZyBjb24tPmVo
X2RhdGEuDQoNClNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0Bh
bWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwg
MiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQppbmRleCA0ODY1NjhkZWQ2ZDYu
LjBlMmVlNTg2OWI1ZiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9yYXMuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5j
DQpAQCAtMTU0MiwxMCArMTU0MiwxMCBAQCBpbnQgYW1kZ3B1X3Jhc19yZWNvdmVyeV9pbml0KHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KIHJlbGVhc2U6DQogCWFtZGdwdV9yYXNfcmVsZWFz
ZV9iYWRfcGFnZXMoYWRldik7DQogZnJlZToNCi0JY29uLT5laF9kYXRhID0gTlVMTDsNCiAJa2Zy
ZWUoKCpkYXRhKS0+YnBzKTsNCiAJa2ZyZWUoKCpkYXRhKS0+YnBzX2JvKTsNCiAJa2ZyZWUoKmRh
dGEpOw0KKwljb24tPmVoX2RhdGEgPSBOVUxMOw0KIG91dDoNCiAJRFJNX1dBUk4oIkZhaWxlZCB0
byBpbml0aWFsaXplIHJhcyByZWNvdmVyeSFcbiIpOw0KIA0KLS0NCjIuMTcuMQ0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5n
IGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
