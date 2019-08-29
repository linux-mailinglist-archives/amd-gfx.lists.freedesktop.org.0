Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBE4A2212
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 19:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371366E086;
	Thu, 29 Aug 2019 17:21:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730088.outbound.protection.outlook.com [40.107.73.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE7F6E086
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 17:21:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Snd2U8ASMV6E4fH6v5keqsxZjZgibHh5pQ1bY5dxj866L14zgB+WvHYMRaoRzcqKrAG0VOssomMoolb8spE+j0LCtW0B4HvquaocpTlqKgd64oBlS+PSKfo2lLlT7W8DSL7fglactsid689veH1p1ViE0Qg0b2Y5HU028EaeuuMKXMt/vgx1Ho8kOlUV3OG1Bz6bOxhtf4ZleBwF06d1SfWpkhcOpP/bi0l49ptfO/WaQwpOg8PSFDrwVSB+GCdtLEvR/ui+dRtIt8B9bpbli5KVmfM0lxXXA8SZzEQm1+Alc8tSNPr7Niwm6tht5OpWTPrz8j79b70tHnsbelMXDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6+xzP4zL8NoaOR1aIBQ4/zFgiWT1J1TTPBEMYA38oA=;
 b=C6mSYyjTmKw05ukKUWctjz9BXFDqstLcSougvhQemSF5DcbwhfVtlPUzZCN3EpmfWHftlXZuJeGxHXTNUjxMME+Pt6GSDGxqXJ8y4TYhky7HvHYuiJi/evEFWX4gwkOLlIFOkC6C0qBv3kELr/9qmTlDc2jU1Abv3pu3Ac8+untN6wb0wUGZwIGVtiy+REXN13mbwnqMzHt8Dzg+4sEBKPKAP98e/QHJJBaKPDacPDSSO6ERuE6897IWZ5mwipj4G6AuLkB51PpfEakzbAwoyb4F9Y+Cpip3Ycrqfwh/bRXgjcwOnV2VtkxBF1r/kDReN5+K8hdHq5jppP1XewOdIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1376.namprd12.prod.outlook.com (10.169.206.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Thu, 29 Aug 2019 17:21:11 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::4047:39c1:ac17:3813]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::4047:39c1:ac17:3813%6]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 17:21:10 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] dmr/amdgpu: Avoid HW GPU reset for RAS.
Thread-Topic: [PATCH 1/2] dmr/amdgpu: Avoid HW GPU reset for RAS.
Thread-Index: AQHVXdtFfi3TnX+12kCnB7mZW1y1nqcRu5gAgABtwQCAAADIAIAAAHgAgAAkZoCAABGDgA==
Date: Thu, 29 Aug 2019 17:21:10 +0000
Message-ID: <2763a85d-cfd7-bf80-5d8b-3590cf35e6d0@amd.com>
References: <1567022426-6612-1-git-send-email-andrey.grodzovsky@amd.com>
 <85798da5-a4f1-28d3-c80f-9f262743cac9@gmail.com>
 <9a46188b-b528-0d1f-8c3f-b6ce5b73649f@amd.com>
 <8c2b0bf3-47ff-ea3b-a682-7ec76240be4d@amd.com>
 <1444ae5f-0997-d1ce-3e1e-23fea8822c88@amd.com>
 <3a39a720-ae2d-0019-aecc-422f0e3f27bb@amd.com>
In-Reply-To: <3a39a720-ae2d-0019-aecc-422f0e3f27bb@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BM1PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::20) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2607:fea8:3edf:fe95:e90f:da85:2954:bd2c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39420338-018b-4997-4f40-08d72ca54918
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1376; 
x-ms-traffictypediagnostic: MWHPR12MB1376:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB13761B02862798048B9B73F4EAA20@MWHPR12MB1376.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(189003)(199004)(966005)(14454004)(31696002)(86362001)(478600001)(25786009)(316002)(110136005)(54906003)(4326008)(5660300002)(53546011)(6506007)(386003)(186003)(52116002)(53936002)(8936002)(99286004)(6246003)(71190400001)(71200400001)(486006)(46003)(81156014)(476003)(81166006)(8676002)(446003)(11346002)(2616005)(6116002)(305945005)(2501003)(229853002)(66946007)(102836004)(66556008)(66476007)(66446008)(64756008)(76176011)(256004)(14444005)(6306002)(7736002)(6512007)(2906002)(6436002)(6486002)(36756003)(31686004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1376;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2UtpE9cU5eZQ/Z1RQ+TyM9nd3YVkuHKbgAAIlbjt08QbA9v0r91zebp9fTrEfvCuqKQdg4wUHF2at7RGOX36TJqYBp+7uJx4aC/4YnxSa3Hu+639mhdtOmuyNASauTIGgorQjiWrpO2qvpPVfedXtO+eVZ9wGiP5hvU6L96A9/2F9orVfColY3ed41LwIU1TJ2Pc2Ff9DvngarLgNrbYqUJ9pMHw8BamQM0jsoGVFZ5ooXGS/ZXn4+GAJZgE1YlLgr+BAkI+DKHTWcisu4yNp1Db5DFDU9caaq5v0fT7TlFqYtlZbAHNgvGh86jUeD9+Q/B2syCWsgillg4EKDxNtk94sgOyNFlfWgT4SJscYpmAJ2ezbAL+DIulmVpX1OATsiUZZ3M1ju6eueTqHmPEjy5SY/gJM1iySS1PGP+G+80=
Content-ID: <45212D57BE974D409803BDDCAA8E992F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39420338-018b-4997-4f40-08d72ca54918
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 17:21:10.7768 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dNMHKrB5fhpHsoGvrigelEp/sFWy2HJtji8n3iMZ7LaTorW5x8t2WkUaJDphd9rawiPpICDAsekonibQhBOzSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1376
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6+xzP4zL8NoaOR1aIBQ4/zFgiWT1J1TTPBEMYA38oA=;
 b=1lqA9tfwVUZyTxbhhUnQMNYI1wNJzJeOJd6RT3cUG6HuHAqQvB/dHgG7otRg/RcjuvdsMsNGI2MAb3CG49OqMKIRtrhWWOxHbTqn5lP3cdxyhWxhYVx/kFvzUkBbseBJsQ/d/YItUDnm3k15IG2ABO2sNBPAf+IZP9lEXhF79n4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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
Cc: "alexdeucher@gmail.com" <alexdeucher@gmail.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQpPbiA4LzI5LzE5IDEyOjE4IFBNLCBLdWVobGluZywgRmVsaXggd3JvdGU6DQo+IE9uIDIwMTkt
MDgtMjkgMTA6MDggYS5tLiwgR3JvZHpvdnNreSwgQW5kcmV5IHdyb3RlOg0KPj4gQWdyZWUsIHRo
ZSBwbGFjZW1lbnQgb2YgYW1kZ3B1X2FtZGtmZF9wcmUvcG9zdCBfcmVzZXQgaW4NCj4+IGFtZGdw
dV9kZXZpY2VfbG9jay91bmxvY2tfYWRldiBpcyBhIGJpdCB3aWVyZC4NCj4+DQo+IGFtZGdwdV9k
ZXZpY2VfcmVzZXRfc3Jpb3YgYWxyZWFkeSBjYWxscyBhbWRncHVfYW1ka2ZkX3ByZS9wb3N0X3Jl
c2V0DQo+IGl0c2VsZiB3aGlsZSBpdCBoYXMgZXhjbHVzaXZlIGFjY2VzcyB0byB0aGUgR1BVLg0K
DQpTbyBpbiB0aGF0IGNhc2UgYW1kZ3B1X2FtZGtmZF9wcmUvcG9zdF9yZXNldCBnZXRzIGNhbGxl
ZCB0d2ljZSAtIG9uY2UgDQpmcm9tIGFtZGdwdV9kZXZpY2VfbG9jay91bmxvY2tfYWRldiBhbmQg
c2Vjb25kIHRpbWUgZnJvbSANCmFtZGdwdV9kZXZpY2VfcmVzZXRfc3Jpb3YsIG5vID8gV2h5IGlz
IGl0ID8NCg0KDQo+IEl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8NCj4gbW92ZSB0aGUgc2FtZSBjYWxs
cyBpbnRvIGFtZGdwdV9kb19hc2ljX3Jlc2V0IGZvciB0aGUgYmFyZS1tZXRhbCBjYXNlLg0KDQoN
ClByb2JsZW0gaXMgaSBhbSBza2lwcGluZyBhbWRncHVfZG9fYXNpY19yZXNldCB0b3RhbGx5IGlu
IHRoaXMgY2FzZSBhcyANCnRoZXJlIGlzIG5vIEhXIHJlc2V0IGhlcmUgc28gaSB3aWxsIGp1c3Qg
ZXh0cmFjdCBpdCBmcm9tIA0KYW1kZ3B1X2RldmljZV9sb2NrL3VubG9ja19hZGV2DQoNCkFuZHJl
eQ0KDQoNCj4NCj4gUmVnYXJkcywNCj4gICDCoCBGZWxpeA0KPg0KPg0KPj4gQW5kcmV5DQo+Pg0K
Pj4gT24gOC8yOS8xOSAxMDowNiBBTSwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6DQo+Pj4+IEZl
bGl4IGFkdmlzZWQgdGhhdCB0aGUgd2F5IHRvIHN0b3AgYWxsIEtGRCBhY3Rpdml0eSBpcyBzaW1w
bHkgdG8gTk9UDQo+Pj4+IGNhbGwgYW1kZ3B1X2FtZGtmZF9wb3N0X3Jlc2V0IHNvIHRoYXQgd2h5
IEkgYWRkZWQgdGhpcy4gRG8geW91IG1lYW4geW91DQo+Pj4+IHByZWZlciBhbWRncHVfYW1ka2Zk
X3Bvc3RfcmVzZXQgdG8gYmUgb3V0c2lkZSBvZiBhbWRncHVfZGV2aWNlX3VubG9ja19hZGV2ID8N
Cj4+PiBZZXMsIGV4YWN0bHkuIEl0IGRvZXNuJ3Qgc2VlbXMgdG8gYmUgcmVsYXRlZCB0byB0aGUg
dW5sb2NrIG9wZXJhdGlvbiBpbg0KPj4+IHRoZSBmaXJzdCBwbGFjZSwgYnV0IHJhdGhlciBvbmx5
IHNpZ25hbHMgdGhlIEtGRCB0aGF0IHRoZSByZXNldCBpcw0KPj4+IGNvbXBsZXRlZC4NCj4+Pg0K
Pj4+IENocmlzdGlhbi4NCj4+Pg0KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCj4+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+PiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
