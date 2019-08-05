Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FE4815D5
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Aug 2019 11:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E77089231;
	Mon,  5 Aug 2019 09:48:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780051.outbound.protection.outlook.com [40.107.78.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A3389231
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Aug 2019 09:48:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3FXwcDIPFIwT/twDMFvm1fGqzOdR5Y8Z5R7WRBsquZ7Bk7L4KPlmSvq6Mr0YMKjKGDRSvLo63qvsJfPPqx0+TXdJnpHOsm9Aa+rC0ubfZennF3Obtx4yg5jJaL3R8GO97zgE3aRW+fP0tYblzZ+Q4c3QO0PZXwNX7zpPtHMDxDp3xt86+KNUp2tDekHMTFE8sWJtgJh7RId1uyx0nxCH7lelGQ95WwSMcmYZlp4y39/vAR73CQxvEWz8985OgFkbDgY77VcGwZJQO5RMZfKJyK2W5J0xPk9uLjOaoVk10us1RNHXvbEstZ5H7lZ8MJf6IfrGyi6rXwzNB4KzXXdYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jk5W5kmW9br6g/yuOW6cSiXbYQ4oYQ6bKULy9CnlzM=;
 b=IrlpzD/ByDSqHzxmoCNbFur4Gm8oCaRJl9mHYldTjpEA1qvuBdu5mksoiykyQuHVkd3t0QEadazMvBb8pFx/HGZv9tjcBcmSwdGTgaQNr1z75bxSlwoXxZoe5uMdRelEOQkUVdJflur1Ur5vYmpU5laJ16nlmCVE9gZnxZqJhb69AIHUcr3Vu0JmsjUWKUsuz7OTbHydPQyKPyySPKd91lvzSSslxAfMqxrHfH2G5NHE937uqHSBwvUPdVO3SRW4VHPPXQP64/wktxWvslfODSgDgqJze4oidjmrF++LC0e64DCrK1/ZBltEdx5GZ08KeXyW586fIYmGBBQFyQla6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1516.namprd12.prod.outlook.com (10.172.34.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 09:48:31 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e%3]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 09:48:31 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "Yin, Tianci (Rico)"
 <Tianci.Yin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/soc15: fix external_rev_id for navi14
Thread-Topic: [PATCH] drm/amdgpu/soc15: fix external_rev_id for navi14
Thread-Index: AQHVS3EkA4EKvnoptUeAcXLScEFrSKbsTdYAgAAAuUA=
Date: Mon, 5 Aug 2019 09:48:31 +0000
Message-ID: <DM5PR12MB14182C295C686901E22911A1FCDA0@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <1564997723-3737-1-git-send-email-tianci.yin@amd.com>
 <DM5PR12MB1418EE05F666713D1B599859FCDA0@DM5PR12MB1418.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB1418EE05F666713D1B599859FCDA0@DM5PR12MB1418.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 864c2590-3541-4f62-1193-08d7198a134e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1516; 
x-ms-traffictypediagnostic: DM5PR12MB1516:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB1516796A608F465C401758E1FCDA0@DM5PR12MB1516.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(189003)(199004)(13464003)(99286004)(25786009)(256004)(71200400001)(55016002)(14454004)(71190400001)(6246003)(9686003)(68736007)(14444005)(6306002)(8676002)(8936002)(966005)(81166006)(86362001)(74316002)(66066001)(7736002)(2940100002)(33656002)(66446008)(476003)(64756008)(66556008)(186003)(76176011)(102836004)(229853002)(53546011)(6506007)(26005)(316002)(446003)(81156014)(54906003)(3846002)(6116002)(7696005)(66946007)(2906002)(76116006)(66476007)(478600001)(11346002)(52536014)(110136005)(486006)(5660300002)(53936002)(305945005)(4326008)(6436002)(2501003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1516;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jnfbzZaqNDyfgjosKmM7BdczoB6XPpKaZlIG4MRS2oUoBgsOWN3q8nrUqcUm/M7dcYQaAo0DWos2f23/ct48feBficAgLdHInCvaiYaRuUwdzH/3wZuG7zBYKgiSB1HSglSOLxhjcqrItfEa771ferMzfLq1RPUGcJvsF1SwEdlUJ/furS4ctGU/3s1RM3LGEs+4GpG07I4U6KWGWRClEfXsOPu+UAEc59PQ4GSoUgaYl1EHGliF1MoOAhvzTac+NOmMYo3wsFM3yvFqUc1CM/5IH5OlCTOUD2oojRsNKDVIFF3jHLU12eNs0Eww4iuhsMUG3W25yS8HEBFYpkDKRJLQPekZcpqYnRHqu8xGhF6NhsAInabGpZsGs4lhjCKBAHk/RlZOwtnE+Iyy2kXMG1+6q5xMNNjcylBTJEDTa94=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 864c2590-3541-4f62-1193-08d7198a134e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 09:48:31.4949 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hawzhang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1516
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jk5W5kmW9br6g/yuOW6cSiXbYQ4oYQ6bKULy9CnlzM=;
 b=Ca8/SyVypDHSYjbanzY9a4eYohkkpbkIBVizj+iwwWfZkseRc7YyDzIRuEgs3BAkrVg/i84fMxq8J8kavYuYoaO6KId3zqkE0vp6nhKa9rJ5cA9+s9qU9pJ4RtDPiFwsqXX9TcuR6zmsWx87U71QpBbyJt6PAaMZRLg9lGY5W34=
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Yin,
 Tianci \(Rico\)" <Tianci.Yin@amd.com>, "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QlRXLCBwbGVhc2UgbWFrZSBzdXJlIHlvdSBoYXZlIHRoZSBsYXRlc3QgZHJtLW5leHQgY29kZSBi
YXNlLiBUaGUgZGVsZXRlZCBjb2RlIHNlZW1zIGxpa2UgaW4gc29tZSB0b3BpYyBicmFuY2guDQoN
ClJlZ2FyZHMsDQpIYXdraW5nDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBh
bWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYg
T2YgWmhhbmcsIEhhd2tpbmcNClNlbnQ6IDIwMTnlubQ45pyINeaXpSAxNzo0NQ0KVG86IFlpbiwg
VGlhbmNpIChSaWNvKSA8VGlhbmNpLllpbkBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCkNjOiBYaWFvLCBKYWNrIDxKYWNrLlhpYW9AYW1kLmNvbT47IFlpbiwgVGlhbmNp
IChSaWNvKSA8VGlhbmNpLllpbkBhbWQuY29tPjsgWXVhbiwgWGlhb2ppZSA8WGlhb2ppZS5ZdWFu
QGFtZC5jb20+DQpTdWJqZWN0OiBSRTogW1BBVENIXSBkcm0vYW1kZ3B1L3NvYzE1OiBmaXggZXh0
ZXJuYWxfcmV2X2lkIGZvciBuYXZpMTQNCg0KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhh
d2tpbmcuWmhhbmdAYW1kLmNvbT4NCg0KUmVnYXJkcywNCkhhd2tpbmcNCi0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQpGcm9tOiBUaWFuY2kgWWluIDx0aWFuY2kueWluQGFtZC5jb20+IA0KU2Vu
dDogMjAxOeW5tDjmnIg15pelIDE3OjM1DQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCkNjOiBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgWGlhbywgSmFj
ayA8SmFjay5YaWFvQGFtZC5jb20+OyBZdWFuLCBYaWFvamllIDxYaWFvamllLll1YW5AYW1kLmNv
bT47IFlpbiwgVGlhbmNpIChSaWNvKSA8VGlhbmNpLllpbkBhbWQuY29tPg0KU3ViamVjdDogW1BB
VENIXSBkcm0vYW1kZ3B1L3NvYzE1OiBmaXggZXh0ZXJuYWxfcmV2X2lkIGZvciBuYXZpMTQNCg0K
RnJvbTogdGlhbmN5aW4gPHRpYW5jaS55aW5AYW1kLmNvbT4NCg0KZml4IHRoZSBoYXJkIGNvZGUg
ZXh0ZXJuYWxfcmV2X2lkLg0KDQpDaGFuZ2UtSWQ6IEk3YjQ2ZjdiNDliNmQwNTg2ZDFmYTI4MmQ0
OTYxODE1ZmIxMjQzNzliDQpTaWduZWQtb2ZmLWJ5OiB0aWFuY3lpbiA8dGlhbmNpLnlpbkBhbWQu
Y29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyB8IDIgKy0NCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9udi5jIGluZGV4IDliY2U2YTEuLjJmNDViZjIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9udi5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9u
di5jDQpAQCAtNTQ2LDcgKzU0Niw3IEBAIHN0YXRpYyBpbnQgbnZfY29tbW9uX2Vhcmx5X2luaXQo
dm9pZCAqaGFuZGxlKQ0KIAkJCUFNRF9DR19TVVBQT1JUX0JJRl9MUzsNCiAJCWFkZXYtPnBnX2Zs
YWdzID0gQU1EX1BHX1NVUFBPUlRfVkNOIHwNCiAJCQlBTURfUEdfU1VQUE9SVF9WQ05fRFBHOw0K
LQkJYWRldi0+ZXh0ZXJuYWxfcmV2X2lkID0gMjA7DQorCQlhZGV2LT5leHRlcm5hbF9yZXZfaWQg
PSBhZGV2LT5yZXZfaWQgKyAyMDsNCiAJCWJyZWFrOw0KIAlkZWZhdWx0Og0KIAkJLyogRklYTUU6
IG5vdCBzdXBwb3J0ZWQgeWV0ICovDQotLQ0KMi43LjQNCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
