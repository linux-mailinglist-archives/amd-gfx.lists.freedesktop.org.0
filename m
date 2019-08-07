Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C96A846EB
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 10:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 089016E67F;
	Wed,  7 Aug 2019 08:14:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740078.outbound.protection.outlook.com [40.107.74.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA016E67F
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 08:14:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJ6QIWxK8nXZq1lMlGg78aAX1DoJXbfO/Zpc2hFvi2tLPDlhcECsXNHljV5rEcb2iO85WRI2bToIwckEpqz3q0t3lUFO87XOyWomPQ+Fk6ys/tbWRYeD+tGHAoOrBvZ4riBOB1cJXtcNrhI2dXwV9KPmmV7rJHpFqKMu3HvpWxj+s1amuetmjxhaFC4NyTLV16sFq61YlghbRuzeJP0VR6QMOau/p6gbY2PEp5IA8arAmbdEUDWyLtSxCWosQWct4IPnRiA5z2FDRLqju6bEhxaVann+h7IVyswtONffI/+J1dC0Hd0R+WMExQylSahfcqBynhF1XTqR06qZ2KuRgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBl70EoYyMWI8ZIxXQqHgmhNa/Sh/4mXYVclPROU+zQ=;
 b=amBPsXLRi8iYdRs0nfDfHuxwEsLJqRW1FnoZmkD3OeqNUaz54kMRAC+eBoKY5Hsm6DAX8DGvBg5FwunSnBpSTueiCuMx3tT0M1a8r7y+4hrRgStuLdElW7QzkfFa+UTAKezrsYoBL/Xq2MpZgQeawiSaE2klqnZIqpdPv2Qm9HH68es9HC9/pieVam8u8soHckSO7ecdjcWNflkuF9lTB8hZpwDmUTmQ4Rg6+GuD82gXn72F+L31KPqX0da+XlkmtAyMWmBdTt+f4FUUpInZPnHy2eCZP0BVSJO2LhAKsjl04k3Px+FbH+wpKVFN67YcM1AoG7athOJFzlS2EU4jug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1930.namprd12.prod.outlook.com (10.175.88.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Wed, 7 Aug 2019 08:14:42 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e%3]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 08:14:42 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Li, Dennis" <Dennis.Li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>
Subject: RE: [PATCH v2 libdrm 0/3] add ras inject test for gfx and umc module
Thread-Topic: [PATCH v2 libdrm 0/3] add ras inject test for gfx and umc module
Thread-Index: AQHVTOyspl/xKkzofkyU1kKTqmQf+qbvVlkA
Date: Wed, 7 Aug 2019 08:14:41 +0000
Message-ID: <DM5PR12MB1418C7E671D67CA685C185C5FCD40@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <20190807065202.30023-1-guchun.chen@amd.com>
In-Reply-To: <20190807065202.30023-1-guchun.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2e6ea8e-a770-4248-ced0-08d71b0f4ca7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1930; 
x-ms-traffictypediagnostic: DM5PR12MB1930:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB1930AD745EDB66E6F10B1D66FCD40@DM5PR12MB1930.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(189003)(199004)(13464003)(5660300002)(66066001)(86362001)(6116002)(6306002)(76116006)(7696005)(6436002)(76176011)(52536014)(53546011)(68736007)(6506007)(229853002)(3846002)(71190400001)(64756008)(66476007)(316002)(2906002)(55016002)(256004)(66946007)(110136005)(102836004)(66556008)(66446008)(14454004)(305945005)(966005)(26005)(99286004)(8936002)(478600001)(7736002)(53936002)(446003)(4326008)(81156014)(476003)(6246003)(6636002)(486006)(81166006)(25786009)(2501003)(71200400001)(186003)(9686003)(8676002)(33656002)(74316002)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1930;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VPsafEGmUiVF0mJlem7DBVUcxSfTywv6fQvZeosmVQ5PajMD/xOzo1E5lCp4fPrNmmwy5V+bO/6h0+803O9qgWNqqo4gQyhTaoleoIwRsxbGgd0LKLwyjf1QCKvzNSC9k8NkTlYhHCMhYct7H0XBTyaLKJUsy9b4PKVZXtxVIGQq8rwvAIjptKvErobdYHEKbOLadykwaBnZMddSFHNzO62s8KC0nd5e8c07QGIZWhhj+/xvqXl1rB1Lt40l6cDB34Sr7aWd/e9B165G1sWVgdcnEuIzsYfvCUtnor97lLqpkImo3BYkCQygY6nAfB0h090Kd9xdjyj03/ysXE2e2h2uRHg0wKHkjSTp+gndZd4GnBXeJSRMOe07xx3uO3J6P71UGuBnZPvLd1YJH5HPTvDciPBlXbdRFe+ON5V8I4Y=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e6ea8e-a770-4248-ced0-08d71b0f4ca7
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 08:14:41.9350 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hawzhang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1930
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBl70EoYyMWI8ZIxXQqHgmhNa/Sh/4mXYVclPROU+zQ=;
 b=oOkBx1VLktymzaXWRKz4YNAnUIL+TIevarQAP/EGHXdTw9/ElU5PMwPbiE2Ws5S9Asz0pbC7oKxQohr0dpX8FakMNPeoa9DznjsLHQtt0QmJxmjKe5cwksm92qPNzV3Dzo93eHlkVH47ypTXg6o35aRIwaCx4CMc4MVwHaVzuPg=
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
Cc: "Chen, Guchun" <Guchun.Chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCg0KUmVn
YXJkcywNCkhhd2tpbmcNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4
IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgR3Vj
aHVuIENoZW4NClNlbnQ6IDIwMTnlubQ45pyIN+aXpSAxNDo1Mg0KVG86IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnOyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsg
TGksIERlbm5pcyA8RGVubmlzLkxpQGFtZC5jb20+OyBQYW4sIFhpbmh1aSA8WGluaHVpLlBhbkBh
bWQuY29tPjsgWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+DQpDYzogQ2hlbiwgR3VjaHVu
IDxHdWNodW4uQ2hlbkBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIIHYyIGxpYmRybSAwLzNdIGFk
ZCByYXMgaW5qZWN0IHRlc3QgZm9yIGdmeCBhbmQgdW1jIG1vZHVsZQ0KDQpUaGVzZSBwYXRjaGVz
IGFyZSB0byBzdXBwb3J0IHJhcyBpbmplY3QgdGVzdCBmb3IgZ2Z4IGFuZCB1bWMgbW9kdWxlcy4N
Cg0KUGF0Y2ggdjI6DQpDb3JyZWN0ICJlamVjdCIgaW4gYWxsIGNvbW1pdHMgdG8gImluamVjdCIu
DQpBZGQgbW9yZSBlcnJvciBjaGVja3MgYW5kIHByaW50IHdoZW4gcGFyc2luZyBjb25maWd1cmF0
aW9uIGZpbGUuDQpBZGQgdW1jIG11bHRpX3VuY29ycmVjdGFibGUgdGVzdCBpbiBkZWZhdWx0IGNv
bmZpZ3VyYXRpb24gZmlsZS4NCg0KR3VjaHVuIENoZW4gKDMpOg0KICBhbWRncHU6IGFkZCBnZngg
cmFzIGluamVjdCBjb25maWd1cmF0aW9uIGZpbGUNCiAgdGVzdHMvYW1kZ3B1L3JhczogcmVmaW5l
IHJhcyBpbmplY3QgdGVzdA0KICBhbWRncHU6IGFkZCB1bWMgcmFzIGluamVjdCB0ZXN0IGNvbmZp
Z3VyYXRpb24NCg0KIGNvbmZpZ3VyZS5hYyAgICAgICAgICAgICB8ICAxOCArKw0KIGRhdGEvYW1k
Z3B1X3Jhcy5qc29uICAgICB8IDI2NyArKysrKysrKysrKysrKysrKysrKw0KIG1lc29uLmJ1aWxk
ICAgICAgICAgICAgICB8ICAgMSArDQogdGVzdHMvYW1kZ3B1L01ha2VmaWxlLmFtIHwgICA1ICst
DQogdGVzdHMvYW1kZ3B1L21lc29uLmJ1aWxkIHwgIDE2ICstDQogdGVzdHMvYW1kZ3B1L3Jhc190
ZXN0cy5jIHwgNTI3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQ0KIDYg
ZmlsZXMgY2hhbmdlZCwgNzgzIGluc2VydGlvbnMoKyksIDUxIGRlbGV0aW9ucygtKSAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGRhdGEvYW1kZ3B1X3Jhcy5qc29uDQoNCi0tDQoyLjE3LjENCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCmFtZC1nZnggbWFpbGlu
ZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
