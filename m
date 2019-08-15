Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D55008E4DE
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Aug 2019 08:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD4D8903B;
	Thu, 15 Aug 2019 06:19:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690087.outbound.protection.outlook.com [40.107.69.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27088903B
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Aug 2019 06:19:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bz8XrPc1zSJe5Wt60lbhxyNHIDu39QBxRMWgZUWIHn6yenDe5EYPuyvkNRpt+bj4QfJ6LhZ54Rs22oXQJ2wFimbm3lbY7cB+oK2FLeWenYkMEVu9+nYy0t0anaUPHcULk/dRsni1A0qjZpcwefcyrwRYECR9BLYatF7NFdECca/soQL0lUPPnivf/Oci0YOBSm3bCEFdsB0rlmsW/eOIaxpGNygVbFaoLliZUdnjyaKLSAsqTzKmM8Pa5GMg59ZW/tTivjqAXzZIlHR0it/scIlBZ/ok9pOYKh2jYDzKtOjh2BGUdvB000UvbTZvWMuYP32MlPZPeIMh7ggF7HvPKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DC1Oc+HTlRVnnY6wNcBaqCLD5J+XUQaAY6KtMeomEc=;
 b=JgNYwhxF8KPIuLqQcxiAXCe53kcFaKoFDoLgh00zsNlkib6ReI7psahPu4lwTiZsmLR9GnTfP5zHRlFDYC0MFvqS0v6HpeHG+r0Xiw3nOobxYDZq5KXbBGZeRp5FEV7IxsjnYX0dsYY0nIcq5jNrXx8dLDQFhefrOn0Td56J8kT0l83U4rc0q0QsIKaJspaZAPGvJDNeJ2EeHjpU5PKw71xLQaFJdoGlg429nuHiCPL6/WilBYQ9drfQX+TmG/uAPmIQBoVpvHPiqnUIEDX8dkaAbgUM/fwVtwzq3mNbWN7Z0fA1ANl/6Y14htEKuXZkkVTinAXPj+bGg0zfnORSXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB2422.namprd12.prod.outlook.com (52.132.141.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.21; Thu, 15 Aug 2019 06:19:32 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e%3]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 06:19:32 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: disable gfxoff for navi12
Thread-Topic: [PATCH] drm/amd/powerplay: disable gfxoff for navi12
Thread-Index: AQHVUxtZuG5Jm79aQ0KYYS5YLNuMkKb7vICw
Date: Thu, 15 Aug 2019 06:19:32 +0000
Message-ID: <DM5PR12MB1418CCC5DC229F147C80698EFCAC0@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <20190815034123.963-1-xiaojie.yuan@amd.com>
In-Reply-To: <20190815034123.963-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c5c81d3-0c06-4e65-bb72-08d72148897a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2422; 
x-ms-traffictypediagnostic: DM5PR12MB2422:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB2422A8EC2DCD474CB5A2861CFCAC0@DM5PR12MB2422.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(199004)(189003)(13464003)(8936002)(478600001)(99286004)(26005)(53936002)(5660300002)(9686003)(2501003)(256004)(110136005)(7736002)(25786009)(33656002)(229853002)(53546011)(6506007)(66476007)(66946007)(11346002)(66446008)(102836004)(64756008)(66556008)(76116006)(55016002)(8676002)(86362001)(6116002)(3846002)(305945005)(486006)(14454004)(6246003)(476003)(186003)(446003)(74316002)(4326008)(316002)(6436002)(7696005)(2906002)(54906003)(52536014)(76176011)(81156014)(81166006)(66066001)(4744005)(71200400001)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2422;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4i3ERVid0z8RB+uDtEa/nuqbdVUUh9FeXA4CGCUqa8lvnYXbksZE11K9ubLhfl5WwmbYeabuAWh9JVDqE91ItFa04qog6EK3B406sHenASG3bFcU3A83m+GSVF7y8h+6XChfMoJaG176RDEnUveML9LxJVj1d3qMoYbCI5HmFvBKWI50N1hC09Yq/tZ0SglljczUdqe9PvMWjKhEkhasxs/dR+xRCS5TpZa+7ktl08XByE4VL/ETHg9/qvJVEWP+WO9Sszg3kM1ILOH0FmMsRvrcwU+fb1uZxLrh52Kl+hv5+dEmB+bczxtqNSAHbKPcpMzI1PBMVxSa74mLnhEwlWePsr+SvPj7VuGxtGhnCyUOBrzx9KuZiA97l6M0pT4QAEkbBrZT9i0q3REjb1qb0ZsWdkp48UxSpD3as85CGvA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c5c81d3-0c06-4e65-bb72-08d72148897a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 06:19:32.1759 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3yyZTK0r95jG9zyzYPYSde034eA0SHwDPVCp/xPhs8WtUZAucMsrCn4uyzi4+YyO2h+4N1ew/Ntpw+iz9kmENA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2422
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DC1Oc+HTlRVnnY6wNcBaqCLD5J+XUQaAY6KtMeomEc=;
 b=Eb+GVt61NnhoH5wjzTyMWiew1Ubabg+xTOcRpo6PeUiGv74orqWWaN26XXqYErG51qs54xH68f6jXovOVeoCSlGu2muGTbjuQ6dEZCW829uJmnIKpCvX8NWSlg9G7pBaaXk7OwcOXxClNFdn16Z/Huw2TtCsTr6nzVJpYnWulhI=
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCg0KUmVn
YXJkcywNCkhhd2tpbmcNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBZdWFuLCBY
aWFvamllIDxYaWFvamllLll1YW5AYW1kLmNvbT4gDQpTZW50OiAyMDE55bm0OOaciDE15pelIDEx
OjQyDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBaaGFuZywgSGF3a2lu
ZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgWGlhbywgSmFjayA8SmFjay5YaWFvQGFtZC5jb20+
OyBGZW5nLCBLZW5uZXRoIDxLZW5uZXRoLkZlbmdAYW1kLmNvbT47IFl1YW4sIFhpYW9qaWUgPFhp
YW9qaWUuWXVhbkBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIXSBkcm0vYW1kL3Bvd2VycGxheTog
ZGlzYWJsZSBnZnhvZmYgZm9yIG5hdmkxMg0KDQpnZnhvZmYgZG9lc24ndCB3b3JrIG9uIG5hdmkx
MiB5ZXQsIHNvIGRpc2FibGUgaXQgZm9yIG5vdw0KDQpTaWduZWQtb2ZmLWJ5OiBYaWFvamllIFl1
YW4gPHhpYW9qaWUueXVhbkBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3YxMF8wLmMgfCAxICsNCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCg0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMNCmluZGV4IDA2NmJhNTkzYWYyMy4u
ZDY0NDY2OWU1ZDkzIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4
X3YxMF8wLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jDQpA
QCAtNTgwLDYgKzU4MCw3IEBAIHN0YXRpYyB2b2lkIGdmeF92MTBfMF9jaGVja19nZnhvZmZfZmxh
ZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikgIHsNCiAJc3dpdGNoIChhZGV2LT5hc2ljX3R5
cGUpIHsNCiAJY2FzZSBDSElQX05BVkkxMDoNCisJY2FzZSBDSElQX05BVkkxMjoNCiAJCWFkZXYt
PnBtLnBwX2ZlYXR1cmUgJj0gflBQX0dGWE9GRl9NQVNLOw0KIAkJYnJlYWs7DQogCWRlZmF1bHQ6
DQotLQ0KMi4yMC4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
