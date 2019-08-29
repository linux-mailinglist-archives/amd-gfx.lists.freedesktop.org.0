Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4FEA0EFE
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 03:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5A789F2A;
	Thu, 29 Aug 2019 01:44:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820071.outbound.protection.outlook.com [40.107.82.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE4C989F2A
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 01:44:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k23lYjiTiSE9qY1hNlyLgy1rfGisfXVFOzR4REf/1Q1MdfNcwMtwMMHew//0UzjFlggcYPFbHbEcE02LLYIw11gdEZm0FJ5juKU7VQ1D1SWAy97y2rv88K1Vnah8V4hyiJ4bGHthSlIQRTY/KVXlR35W1e56MT1kc5HxHm60BcDhxGl1lnF7KcHRVYXOuipYZHq3tDGJ/XdOJj6eteT8PJBeil3i6s2rQms3doVhDSbuhjBoUsQ4hW6iTmbnGzGLTJTcvSFB1G1o976yHBfWiDxqiP2pkXfTd9/TPSXMECymW7iX3F3g0A7JvJFAF2TT4yPlcgtQXQWKr0J6Q+mCHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MeLqwvvFTRkk6awOsmykZyJxbSePZZgE/qW4nYH9CXI=;
 b=EL1eh6yPLuosAF0ipwbQOLoeOV2Et86b2Mc8vEjRAu/AJA7/coexq1q1kqWmpaS4bKO6DZRDP0ljSbJ78buHkd0UoeUqWiwz4ILCFclXCav5kwbcajklqpjXRs/eMSTpDAMHCT6HzwnOpZMe03RjGP3AieNsWsos/L+8ORZn6Wg5r1J12hWk83IaxPhUJaqFJLuRqdedcSv7uRjgOBFYKGOSA1Pj300D9wBtajjTP+M8Se4z4yU+h7Hw9EKOmhME6+7VHHN5hIi03NordpyqqM1BpcBOYeavOdjaShMTJt/t8rGNHBsjJYBoZidh1REPs+LAz9Ub5d6gakIa3z9bEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB2899.namprd12.prod.outlook.com (20.179.66.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Thu, 29 Aug 2019 01:44:04 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::acf1:c2b4:2a91:c12]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::acf1:c2b4:2a91:c12%6]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 01:44:04 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amdgpu/virtual_dce: drop error message in hw_init
Thread-Topic: [PATCH] drm/amdgpu/virtual_dce: drop error message in hw_init
Thread-Index: AQHVXahjarVSqWTdj022PWULceBx56cRWylH
Date: Thu, 29 Aug 2019 01:44:03 +0000
Message-ID: <C13ED815-385D-4FA6-ABEB-312BE5055693@amd.com>
References: <20190828135610.3827-1-alexander.deucher@amd.com>
In-Reply-To: <20190828135610.3827-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [112.64.61.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 309698d9-4337-4a69-848d-08d72c225faa
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB2899; 
x-ms-traffictypediagnostic: BN8PR12MB2899:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB28998A035590AB3528C381EF89A20@BN8PR12MB2899.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(199004)(189003)(6436002)(33656002)(86362001)(6486002)(66066001)(15650500001)(3846002)(2906002)(6116002)(8676002)(305945005)(2616005)(446003)(81166006)(486006)(6506007)(81156014)(316002)(7736002)(102836004)(53546011)(229853002)(476003)(11346002)(26005)(76176011)(54906003)(36756003)(186003)(6306002)(6512007)(966005)(4326008)(1411001)(64756008)(6916009)(66476007)(66556008)(8936002)(99286004)(25786009)(6246003)(66446008)(256004)(71200400001)(71190400001)(91956017)(76116006)(14454004)(478600001)(5660300002)(66946007)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2899;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: may8KruNBl97xl/qQLJkvo7TvRhSHh24ou6c1BcTmASmZdZ4C/Zqc2AacV1KHphuD32MYPNhA62Nik7YwkC3pnD8DBuB3w+SsuabsJgvivpG6H0FDEs5tfCJ4GYEaOMewdmO4i9udkaQPUaJ8Q3DwFgO90/fO84YBsRBg5DjDZh0k++R7jX9Ry2HYkYwkMSPS6IT+y4ZzkUrl7X0V+LkY97JtTOSKvoE0g8djI2mCZPdNsEc1EYDXwqv+X7GWkZ2VYbYcX5DCYlB0XVRGm6Cp2wdvIEXFPk2WBbTyb3KQEZjHl4cUzVA6nidxkKVTYNhCT6hq2nXe1luGXW1wXVmCy8RfzWC0ZpeHMyiXdNq0LfXyPxcgpstSHa4nyVLleO6RNHBzk71VHpIyztbRB38fQT2fj9HGJl3sZbjooXyYPY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 309698d9-4337-4a69-848d-08d72c225faa
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 01:44:04.0086 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tZkaB5sUBSr8vv6v7iMvRoY85RIZ/ciqbUkWTxARnf2YOnFG/ze3/Y7PHB3rUePZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2899
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MeLqwvvFTRkk6awOsmykZyJxbSePZZgE/qW4nYH9CXI=;
 b=edVtxOPZBUiBqHx4yFq/SnLb9GTd5zH483xX7LLx1HrATkmj14rzud2E7UuO4zugigNaEvVHH4yYtyDz34jyCqJy1+ZeLvOTuUmIRgYwGdQB+3CzCKcQPvXCbp6DxQrgYioQjgJWC5tkKIsRf51wKMdlIvKx9rm28aGbUVX+qQM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+CgpCUiwKWGlh
b2ppZQoKPiBPbiBBdWcgMjgsIDIwMTksIGF0IDk6NTYgUE0sIEFsZXggRGV1Y2hlciA8YWxleGRl
dWNoZXJAZ21haWwuY29tPiB3cm90ZToKPiAKPiBObyBuZWVkIHRvIGFkZCBuZXcgYXNpYyBjYXNl
cy4gIFRoaXMgaXMgYSBzdyBkaXNwbGF5Cj4gaW1wbGVtZW50YXRpb24sIHNvIGp1c3QgZHJvcCB0
aGUgZXJyb3IgbWVzc2FnZSBzbyB3aGVuCj4gd2UgYWRkIG5ldyBhc2ljcywgYWxsIHdlIGhhdmUg
dG8gZG8gaXMgYWRkIHRoZSB2aXJ0dWFsCj4gZGNlIElQIG1vZHVsZS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gLS0tCj4gZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3ZpcnR1YWwuYyB8IDExICstLS0tLS0tLS0tCj4g
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMCBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3ZpcnR1YWwuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RjZV92aXJ0dWFsLmMKPiBpbmRleCA2ZGFkYmVkN2NlNDMu
LmZlMjQyY2M3YzA0ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9k
Y2VfdmlydHVhbC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3ZpcnR1
YWwuYwo+IEBAIC00NTIsMTcgKzQ1Miw4IEBAIHN0YXRpYyBpbnQgZGNlX3ZpcnR1YWxfaHdfaW5p
dCh2b2lkICpoYW5kbGUpCj4gI2VuZGlmCj4gICAgICAgIC8qIG5vIERDRSAqLwo+ICAgICAgICBi
cmVhazsKPiAtICAgIGNhc2UgQ0hJUF9WRUdBMTA6Cj4gLSAgICBjYXNlIENISVBfVkVHQTEyOgo+
IC0gICAgY2FzZSBDSElQX1ZFR0EyMDoKPiAtICAgIGNhc2UgQ0hJUF9BUkNUVVJVUzoKPiAtICAg
IGNhc2UgQ0hJUF9SRU5PSVI6Cj4gLSAgICBjYXNlIENISVBfTkFWSTEwOgo+IC0gICAgY2FzZSBD
SElQX05BVkkxNDoKPiAtICAgIGNhc2UgQ0hJUF9OQVZJMTI6Cj4gLSAgICAgICAgYnJlYWs7Cj4g
ICAgZGVmYXVsdDoKPiAtICAgICAgICBEUk1fRVJST1IoIlZpcnR1YWwgZGlzcGxheSB1bnN1cHBv
cnRlZCBBU0lDIHR5cGU6IDB4JVhcbiIsIGFkZXYtPmFzaWNfdHlwZSk7Cj4gKyAgICAgICAgYnJl
YWs7Cj4gICAgfQo+ICAgIHJldHVybiAwOwo+IH0KPiAtLSAKPiAyLjIwLjEKPiAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGlu
ZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
