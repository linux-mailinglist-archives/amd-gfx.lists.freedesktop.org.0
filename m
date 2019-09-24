Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD01BBC183
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2019 07:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B64F6E9F4;
	Tue, 24 Sep 2019 05:52:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810079.outbound.protection.outlook.com [40.107.81.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053D46E9F4
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 05:52:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lO40wK5PoJD5lRY1BwY7Gezy1pyx9RVy5gzWKK3sIrvDzETcx5A6cjk72MqVppMHNJZViI38dheZpOuTh92aZR/RKYPkxhKcrg9XAbm9RR7xU0biMNT7nBGxlSICxVWrvOvujBvhOf4Cf9Am1gDR2obL8+f8g2iEufzkbyMfWOEgbgnV9rFHN2KFmeLriH7EO6BPlcrcyyQukVnlb3aTji6jlTklV+tq5bNX3+Oy383qSdydSfao7PlP+UL3Poi2Hh6aWDDiUGoJgU85wkQz1a6IudCjr0y33kcTMChTMZ/BHMorohRlmwghO0+5F93pHjD9iKu0ojz7hjte+V51VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpeLg7e1cM+ZxLa3kwnXGg3aw/Obrj0GRyn0V1pBRiM=;
 b=P3BPPMh6xTPaTTqDeRvT/CBBcxjI/cm/ORT1sg8w/4aUvV3+PZw+7StKRTx0UE7U644Z+z88cGzOULYF93sweXEa9JG0kvkQrtqmqgu9AINSq2/2GOOtYO6hP2GSeFb3wJr1g7OtIu/aF9O5vxtkktwT2RazrqV2Ozgz3uR3yMLdWMGsIGO9Vb3vyJAbuV0yPgEfTEEdbWa1lwZhqHneBOWOW/aKBACvcL+nz16FR6Tyh3li5MZ3isSTaA9J1SVPjVtJLgcXSs+AYZW+5rKtn9NDs3Y7/Nh6qKwomKf01+G5EmnciA/vCgAURIs3ZunU5yZiEpnnPF3V/w2yXQLVEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3933.namprd12.prod.outlook.com (10.255.238.94) by
 MN2PR12MB3390.namprd12.prod.outlook.com (20.178.242.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Tue, 24 Sep 2019 05:52:27 +0000
Received: from MN2PR12MB3933.namprd12.prod.outlook.com
 ([fe80::a4d2:a803:ad8d:d341]) by MN2PR12MB3933.namprd12.prod.outlook.com
 ([fe80::a4d2:a803:ad8d:d341%5]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 05:52:27 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: fix an UMC hw arbitrator bug
Thread-Topic: [PATCH] drm/amdgpu: fix an UMC hw arbitrator bug
Thread-Index: AQHVcomZS0QuhS/DX0Kc0XjV+o9Upac6USwAgAABX+A=
Date: Tue, 24 Sep 2019 05:52:26 +0000
Message-ID: <MN2PR12MB3933481AD16FC69B718B596C84840@MN2PR12MB3933.namprd12.prod.outlook.com>
References: <1569296333-5386-1-git-send-email-Monk.Liu@amd.com>
 <DM5PR12MB1418A62797503948F23937BAFC840@DM5PR12MB1418.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB1418A62797503948F23937BAFC840@DM5PR12MB1418.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7eb4955e-f0e5-489b-fc08-08d740b3614c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3390; 
x-ms-traffictypediagnostic: MN2PR12MB3390:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB33902DB55BA83531721BD00D84840@MN2PR12MB3390.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(189003)(199004)(13464003)(66556008)(66446008)(71190400001)(71200400001)(64756008)(9686003)(6306002)(66066001)(7736002)(305945005)(3846002)(6436002)(74316002)(6116002)(55016002)(966005)(110136005)(66946007)(33656002)(8676002)(8936002)(26005)(478600001)(186003)(14454004)(76176011)(76116006)(25786009)(229853002)(102836004)(53546011)(6506007)(66476007)(81156014)(81166006)(316002)(14444005)(2501003)(86362001)(486006)(99286004)(446003)(11346002)(2906002)(7696005)(52536014)(6246003)(5660300002)(256004)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3390;
 H:MN2PR12MB3933.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8Vs2btpdgNzp9I/ns/gjmt9SyflaWtPtqvyKoa/B1OZKlxuyLXYG8gt61tCeEcCaci6l/47i215BtTYBTi5DvEPAb+OtzWqjTLnXQzG5CdPLZRlkBfTmMOaoVtNCCQMB/6taVRgxMuDJN6f+7rfAx3SAMrSG9F9q6DJq5Ell/RypxjXMXc9b0H5KxA/M8LBLShVMavYPqmxtVPOj/kUP3yXhi7Xot7L/em+WtCU9+H+tvvrVSlAYoy0a0I9ar25b29ovb6N5FirPquDa3zilqiWrwL7FD6tv3hSNIaqmQGsaQBPN1dge44mij7rlIg3UJO9Mi/w3QhBIRAklP/RL2XGqC5FbevYG9bcw+a0gL3M0JhWSIodAGi0pxmLkvx+V21IR2RcGSnCAp3kdJdJ6Yw/wYXRee8X0vYmqmX9S85M=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb4955e-f0e5-489b-fc08-08d740b3614c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 05:52:27.0254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l57klJvwcFkwkHUH52oqhvwzjEFtFIviMqgojU7DSj7atGv4qMy3vaR9r04KYCs8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3390
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpeLg7e1cM+ZxLa3kwnXGg3aw/Obrj0GRyn0V1pBRiM=;
 b=K3iMDA9k/NChGfdQ0tqBP39pE52JgCsLdvJwEfkvo/SPcOYoG8qkot5HVNDVzvvNakOcv3mIVkTp4fB28XOFGpz8TJHnsm9fbpLeuv24QnO97Yzb3AooCWsg119BCjsYGRi6rDaT89Prx4EcO6Nk6NncYBqlnzMzn3VzW3xaD38=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Monk.Liu@amd.com; 
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

T2theSwgSSBjYW4gbGltaXQgaXQgb25seSBmb3IgdmVnYTEwIGFkYXB0ZXIgDQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCk1vbmsgTGl1fEdQVSBWaXJ0dWFsaXphdGlv
biBUZWFtIHxBTUQNCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogWmhhbmcs
IEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4gDQpTZW50OiBUdWVzZGF5LCBTZXB0ZW1i
ZXIgMjQsIDIwMTkgMTo0NCBQTQ0KVG86IExpdSwgTW9uayA8TW9uay5MaXVAYW1kLmNvbT47IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogTGl1LCBNb25rIDxNb25rLkxpdUBhbWQu
Y29tPg0KU3ViamVjdDogUkU6IFtQQVRDSF0gZHJtL2FtZGdwdTogZml4IGFuIFVNQyBodyBhcmJp
dHJhdG9yIGJ1Zw0KDQpUaGUgcGF0Y2ggaXMgaW4gaGlnaCByaXNrIHRvIGJyZWFrIG90aGVyIFZH
IHNlcmllcyBhbmQgTUkgc2VyaWVzLiBBbnkgY29uZmlkZW5jZSB0aGlzIGlzIGEgY29tbW9uIGh3
IGJ1ZyBhY3Jvc3MgYWxsIFVNQyA2LnggZ2VuZXJhdGlvbnM/IA0KDQpSZWdhcmRzLA0KSGF3a2lu
Zw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1i
b3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIE1vbmsgTGl1DQpTZW50
OiAyMDE55bm0OeaciDI05pelIDExOjM5DQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCkNjOiBMaXUsIE1vbmsgPE1vbmsuTGl1QGFtZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0hdIGRy
bS9hbWRncHU6IGZpeCBhbiBVTUMgaHcgYXJiaXRyYXRvciBidWcNCg0KaXNzdWU6DQp0aGUgVU1D
IGgvdyBidWcgaXMgdGhhdCB3aGVuIE1DTEsgaXMgZG9pbmcgdGhlIHN3aXRjaCBpbiB0aGUgbWlk
ZGxlIG9mIGEgcGFnZSBhY2Nlc3MgYmVpbmcgcHJlZW1wdGVkIGJ5IGhpZ2ggcHJpb3JpdHkgY2xp
ZW50IChlLmcuIERJU1BMQVkpIHRoZW4gVU1DIGFuZCB0aGUgbWNsayBzd2l0Y2ggd291bGQgc3R1
Y2sgdGhlcmUgZHVlIHRvIGRlYWRsb2NrDQoNCmhvdzoNCmZpeGVkIGJ5IGRpc2FibGluZyBhdXRv
IFByZUNoZyBmb3IgVU1DIHRvIGF2b2lkIGhpZ2ggcHJpb3JpdHkgY2xpZW50IHByZWVtcHRpbmcg
b3RoZXIgY2xpZW50J3MgYWNjZXNzIG9uIHRoZSBzYW1lIHBhZ2UsIHRodXMgdGhlIGRlYWRsb2Nr
IGNvdWxkIGJlIGF2b2lkZWQNCg0KU2lnbmVkLW9mZi1ieTogTW9uayBMaXUgPE1vbmsuTGl1QGFt
ZC5jb20+DQpDaGFuZ2UtSWQ6IElhZjZlYjJhMjBhNDc4NWVjODQ0MGU2NGQ1ZTBjYWU2N2FhMDYw
M2RhDQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIHwgMTggKysr
KysrKysrKysrKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykNCg0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jDQppbmRleCA2MTAyZGVhLi44MjcxYjBjIDEw
MDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KQEAgLTEzMDYsNiArMTMwNiwy
NCBAQCBzdGF0aWMgaW50IGdtY192OV8wX2dhcnRfZW5hYmxlKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQ0KIAkJICh1bnNpZ25lZCkoYWRldi0+Z21jLmdhcnRfc2l6ZSA+PiAyMCksDQogCQkg
KHVuc2lnbmVkIGxvbmcgbG9uZylhbWRncHVfYm9fZ3B1X29mZnNldChhZGV2LT5nYXJ0LmJvKSk7
DQogCWFkZXYtPmdhcnQucmVhZHkgPSB0cnVlOw0KKw0KKwkvKiBkaXNhYmxlIGF1dG8gUGNoZyBp
cyBhIHcvYSBmb3IgdGhlIHZlZ2ExMCBVTUMgaGFyZHdhcmUgYnVnICovDQorCVdSRUczMigweDUw
MTBjLzQsIDB4MTAwMik7DQorCVdSRUczMigweDUyMTBjLzQsIDB4MTAwMik7DQorCVdSRUczMigw
eDU0MTBjLzQsIDB4MTAwMik7DQorCVdSRUczMigweDU2MTBjLzQsIDB4MTAwMik7DQorCVdSRUcz
MigweDE1MDEwYy80LCAweDEwMDIpOw0KKwlXUkVHMzIoMHgxNTIxMGMvNCwgMHgxMDAyKTsNCisJ
V1JFRzMyKDB4MTU0MTBjLzQsIDB4MTAwMik7DQorCVdSRUczMigweDE1NjEwYy80LCAweDEwMDIp
Ow0KKwlXUkVHMzIoMHgyNTAxMGMvNCwgMHgxMDAyKTsNCisJV1JFRzMyKDB4MjUyMTBjLzQsIDB4
MTAwMik7DQorCVdSRUczMigweDI1NDEwYy80LCAweDEwMDIpOw0KKwlXUkVHMzIoMHgyNTYxMGMv
NCwgMHgxMDAyKTsNCisJV1JFRzMyKDB4MzUwMTBjLzQsIDB4MTAwMik7DQorCVdSRUczMigweDM1
MjEwYy80LCAweDEwMDIpOw0KKwlXUkVHMzIoMHgzNTQxMGMvNCwgMHgxMDAyKTsNCisJV1JFRzMy
KDB4MzU2MTBjLzQsIDB4MTAwMik7DQogCXJldHVybiAwOw0KIH0NCiANCi0tDQoyLjcuNA0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KYW1kLWdmeCBt
YWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
