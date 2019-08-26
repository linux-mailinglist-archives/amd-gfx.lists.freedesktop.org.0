Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6F19D183
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 16:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4DC89872;
	Mon, 26 Aug 2019 14:20:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770072.outbound.protection.outlook.com [40.107.77.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC6289872
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 14:19:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mwX1k8ZoAKR8rUno1wzHLQiqv6U1RZjQBTGpXf+o+PQiECV8kKILONZMVK94r7BUvmrHqtGyyFExIIdsMdAMLVjTSVzr29kSAMd9L98GFfErRR+0ebS3M3fpMtdKxGHcnIbULCK9oQiCVZErKTsuB8dKsm5TUbTbMPDqi8nagCvWXMl+sHnBEWy+mkz5rFG2hKr8rqJPtDQIeKE6puaWc6JKMX2+JxTdfx8lSp+o+k5KyutoYUER5ofDqeDjUbRfsRU2mPHIRVGhnrZx4n0ByHydRBNInc0RP9a5ci8gIs+h/he0oPvCUv7NCj14YcOp0MIqfR8+bWMRhsUpeXHCmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnVYpHeTQTKsI7CAdoupv0aS50q9DTZkKk7PUV695UM=;
 b=J3DtAUpr7BmTnD8pF+qHSjlSE/R28o56hp43Gf/cUrxi7zTLDBe+cU3hUMrTn3BDxqOtiK4YqU+qv0xFiwORIgUUfTtwMrbmfsHKTKArdFOhHIZ3XWx7z98LRPZ6k2zeCEvIq2QF2H5sgEqd7WAzzA6R6O71nNHI5oACfjvHoRQOufvP0c17DuvjR8AGVO+d/MWXZXchzEErG3FuRcgh5dJxehaxV0Kbanyviw+6BLj5eZ5Fo/hHrLl3VfwfsgJ93qV25/0bVFIIdcoqukpbiRGCnIh33TPtx3cuRHqBVA0wVQSOxU6ZxUnsZFT11xQ2zjP7Y++oB22s+xOyIRAU4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3269.namprd12.prod.outlook.com (20.179.93.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 14:19:58 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::d594:85f1:65da:dd82]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::d594:85f1:65da:dd82%5]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 14:19:57 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/display: Fix error message
Thread-Topic: [PATCH] drm/amd/display: Fix error message
Thread-Index: AQHVXBju0K/WpIJdLkaIxU3z/frR/6cNeniA
Date: Mon, 26 Aug 2019 14:19:57 +0000
Message-ID: <56ada989-630e-a50e-e5a8-728944531b30@amd.com>
References: <1566829009-6929-1-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1566829009-6929-1-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::15) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d0b33162-b730-4c55-175f-08d72a307930
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3269; 
x-ms-traffictypediagnostic: BYAPR12MB3269:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3269911DBAC78A638498ED39ECA10@BYAPR12MB3269.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:188;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(199004)(189003)(2501003)(71200400001)(6486002)(53936002)(15650500001)(6246003)(14454004)(31686004)(71190400001)(478600001)(8936002)(8676002)(66476007)(316002)(3846002)(86362001)(6116002)(66446008)(36756003)(110136005)(7736002)(66556008)(64756008)(5660300002)(81156014)(25786009)(6512007)(81166006)(229853002)(2906002)(2616005)(476003)(11346002)(76176011)(386003)(53546011)(6506007)(52116002)(486006)(99286004)(66066001)(446003)(256004)(14444005)(186003)(66946007)(26005)(102836004)(4744005)(31696002)(305945005)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3269;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5If27Y27nDVtO0gli+OzPrczp8WSBBMiD+WW0tJTgQ8GTIWdqFif2Axoe6j4PNyUT4mBhC70LAqnxKNe/UFK8NdYj3yEHadoDY6gNZAJHg9L+VgdeUV6aEjrSTtr2eCz0G0NIHvepJuq5Aui7PoPqQSSJJXfwEzy5V0rpy3MNTCVrzJnnJSLj8WVxk+I3fBdjk9AiDBT/xeDQvDgr2453nGhs0gBhDTIMAST9ZjaYHcbkRU4nATvP9vg7/DMU+R6IiRzevqkPFHomEtZsEywN0XAKHHjc+S/cfBNMtKrz1xJNcMfb8rBpFbgG2o4xEKEF2kr28Ix+MsKIKmWafHiKVHGALKeUS5p62+RGWpURsYP4bmWlAP1Vob/mMX7abkS8SgUskPDfK8cusmV62GH54RP/FKnw3+kvU4bN5uHb6Q=
Content-ID: <6204F1BED39E1D4E8A436999435E1B64@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b33162-b730-4c55-175f-08d72a307930
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 14:19:57.8684 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rVNomPmnDtFjKaQ1tip5P+u8erjSV5hWVW0FtP6BE2CqybjB/3ebDsCv67taOs1WeVs1LQkDw81ikHPOK1TSsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3269
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnVYpHeTQTKsI7CAdoupv0aS50q9DTZkKk7PUV695UM=;
 b=vLKoBP0IZMvims0O6hbeTx0Xu8fP9hm8aEoOi9jn0WY6/dOaW0CBqpdbHhiVE5sXNKn4yZt8xCdWhx+WWfnT1Rq7IBWlTOnxzGXFYlljS0IwHSo8PQCEg0myjPJgRpTZudhwapaLfepEurLPkZTelL+/Ju6cnK5ZMkRDuK6DgoQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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

T24gOC8yNi8xOSAxMDoxNiBBTSwgQW5kcmV5IEdyb2R6b3Zza3kgd3JvdGU6DQo+IFNpbmNlIHJl
c2VydmF0aW9uX29iamVjdF93YWl0X3RpbWVvdXRfcmN1IGlzIGNhbGxlZCB3aXRoDQo+IGludGVy
cnVwdGFibGUgc2V0IHRvIGZhbHNlIGl0J3Mgd3JvbmcgdG8gc2F5DQo+ICdvciBpbnRlcnJ1cHRl
ZCcgaW4gdGhlIGVycm9yIG1lc3NhZ2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3Jv
ZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IE5pY2hv
bGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4NCg0KPiAtLS0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMiAr
LQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jDQo+IGluZGV4IDkzZjY0NDYuLmRhM2Q3NjIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPiBAQCAtNTY4NSw3ICs1
Njg1LDcgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2RtX2NvbW1pdF9wbGFuZXMoc3RydWN0IGRybV9h
dG9taWNfc3RhdGUgKnN0YXRlLA0KPiAgIAkJCQkJCQlmYWxzZSwNCj4gICAJCQkJCQkJbXNlY3Nf
dG9famlmZmllcyg1MDAwKSk7DQo+ICAgCQlpZiAodW5saWtlbHkociA8PSAwKSkNCj4gLQkJCURS
TV9FUlJPUigiV2FpdGluZyBmb3IgZmVuY2VzIHRpbWVkIG91dCBvciBpbnRlcnJ1cHRlZCEiKTsN
Cj4gKwkJCURSTV9FUlJPUigiV2FpdGluZyBmb3IgZmVuY2VzIHRpbWVkIG91dCEiKTsNCj4gICAN
Cj4gICAJCS8qDQo+ICAgCQkgKiBUT0RPIFRoaXMgbWlnaHQgZmFpbCBhbmQgaGVuY2UgYmV0dGVy
IG5vdCB1c2VkLCB3YWl0DQo+IA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
