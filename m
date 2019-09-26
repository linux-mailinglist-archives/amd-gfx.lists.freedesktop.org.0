Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7216BBFB43
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Sep 2019 00:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD446E046;
	Thu, 26 Sep 2019 22:16:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700068.outbound.protection.outlook.com [40.107.70.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79ADB6E046
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 22:16:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P75I5cBT0fpjzkrNWHQeRO8Va4zYeyQEAggKP73jYsEPDT8jUz/5yw6XlNt9MRoDqeKWu/SN0ScUNnYmVOfp2DZIMjO+whOK2fcMXSydJR4sclh+tVEQJTStodrRQtQttDkGh2K7hvvYNSxP5At9CFRr+d1AFGIE+ws9ZFIwbWoLYYevdnOfPMTazcUu1eZG+kcOuZkcbsL1CcN/QqTjtcKxttQuAqhb3DyuJWF6lqz6pdmDXJJKnCjyDxipSg2IXdWClEcFzpxGG0MCJe02pzhOb4b+9GsphoMBrOggTF6jL3Up88L7XMpKo8Vs2quYz+yln7E4IlOTHI1cSA0Suw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5kUuPU8CTuqlTXRwI+L/yesUUm7TDlCacRGNdSYuB8=;
 b=k6OZYOhJxFrzcHsR/gnPYBa7nPG6LlQiVxH0asXzKmX9GTMVd/OmU4s+SR5Kfwtu84V9cIVMkqcONzpLOZnm9heySsgn4X9BnQfYTbvd1tuufwH6wJd6+T1qNZZtU6Q+1FbA6911dUHYUNpb4th0fvWDYy9zA0ZU5XpO+EBk+d8bFgZmhqaTxIpRiTZjhcVK4cRblSXiCJgJUSyzYstx9dRKwrwe+t8xkbzkng/PEAEOO64azuSgw0VvSlJ4DWtm7JsYAMT8H45GfxCEyL/JAy2oecVgF7OA0mQO1hWZB1lAKfL3SKNxM8m33erZ1iOwqz+pQRhqHPDWkQfGXgM8yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3817.namprd12.prod.outlook.com (10.255.173.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Thu, 26 Sep 2019 22:16:19 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 22:16:19 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zhao, Yong" <Yong.Zhao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amdkfd: Record vmid pasid mapping in the driver
 for non HWS mode
Thread-Topic: [PATCH 1/2] drm/amdkfd: Record vmid pasid mapping in the driver
 for non HWS mode
Thread-Index: AQHVdLEqfaqrBCzjNUSyTJI1+qxGEac+e3SAgAAGhYCAAASuAA==
Date: Thu, 26 Sep 2019 22:16:19 +0000
Message-ID: <02740fdf-0bfe-9f42-600f-aa4a491cdc46@amd.com>
References: <20190926212640.28989-1-Yong.Zhao@amd.com>
 <d1129739-2f34-4bc3-96f7-a9a9c999313a@amd.com>
 <397a92e1-a5cc-0607-43c6-2922273a1459@amd.com>
In-Reply-To: <397a92e1-a5cc-0607-43c6-2922273a1459@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTXPR0101CA0062.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::39) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca674fa6-6476-490d-89d9-08d742cf2804
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3817:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3817FF7DDED236B273B3FE9192860@DM6PR12MB3817.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(189003)(199004)(86362001)(99286004)(186003)(31696002)(36756003)(71190400001)(71200400001)(31686004)(52116002)(486006)(76176011)(26005)(478600001)(256004)(14454004)(65806001)(65956001)(53546011)(66476007)(66556008)(5660300002)(102836004)(2501003)(11346002)(8936002)(66946007)(305945005)(25786009)(446003)(476003)(66446008)(2616005)(7736002)(81166006)(81156014)(8676002)(6436002)(3846002)(58126008)(386003)(6506007)(66066001)(64756008)(110136005)(6116002)(316002)(6246003)(6486002)(229853002)(6512007)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3817;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FiSixUiX/hVC2JEkY+w2pbiWd9pOwQjcEFO91DfKg9ywwM9HJXSIDi5EEx8snE6jVez1fj69+uUjS1Xx7M8QGBkkM1XZyN/FIROuvsRh5LWLp8sPdK+9xa3jW9HTShg0/TRr24h5Ozi2lvuu3GaiizgE7Q110jpF8YbxC9xvuqfa3wRbuba+8A2ocx4QHSUo09aTqIFRbStNkAS4I+WWTUFyRiVZFCeuJwJfihaBC1Qv3OEVQMesbqOWhOw3zqnuH7H1IseC16+ep8e4TtFSyrpsb7N1gHr/7DdpH4V5fi4R0qfbKGQsQ0Ep1xR1E/IfYJ390gRf5HgAcj54JJQS84tC89Y/i7nZQJbrWBmR9jd5XO6u38a1LtOFt01QfES37qedaL181MjZbf4CnI1Do6A8ApY+2BnDqAao3HuPSlo=
Content-ID: <8D6148CF7E83864B8909BDC6D9DEFBBC@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca674fa6-6476-490d-89d9-08d742cf2804
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 22:16:19.5492 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FxLRzi2MEjYw7tSLv2ZnCm2d1juQgvHru6wOhb+Bcq4w4BbLENnK7KHG4T+EM0n/LziDtFrpJhGYR/aSqkWZ8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3817
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5kUuPU8CTuqlTXRwI+L/yesUUm7TDlCacRGNdSYuB8=;
 b=xrqDiKabUc62QnPD/kOgJCikDLxSXZKVemGN3QrI/ypbyR7XWb4T4FncRU766c+lSA5ndV0xwfb4NCs/2ZdhKJl1tRGMWqlRL9x2r5lx7d9xH4Ti1A0NSUQBUxdeGZqhbLs3MCTV+2LAFoLYejJI9YFTOvT28210zQOtmsZmhlE=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQpPbiAyMDE5LTA5LTI2IDU6NTkgcC5tLiwgWmhhbywgWW9uZyB3cm90ZToNCj4gT24gMjAxOS0w
OS0yNiA1OjM2IHAubS4sIEt1ZWhsaW5nLCBGZWxpeCB3cm90ZToNCj4+IE1pbm9yIG5pdC1waWNr
IGlubGluZS4gT3RoZXJ3aXNlIHRoaXMgcGF0Y2ggaXMNCj4+DQo+PiBSZXZpZXdlZC1ieTogRmVs
aXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQo+Pg0KPj4gT24gMjAxOS0wOS0y
NiA1OjI3IHAubS4sIFpoYW8sIFlvbmcgd3JvdGU6DQo+Pj4gVGhpcyBtYWtlcyBwb3NzaWJsZSB0
aGUgdm1pZCBwYXNpZCBtYXBwaW5nIHF1ZXJ5IHRocm91Z2ggc29mdHdhcmUuDQo+Pj4NCj4+PiBD
aGFuZ2UtSWQ6IEliNTM5YWFlMjc3YTIyN2NjMzlmNjQ2OWFlMjNjNDZjNGQyODliODdiDQo+Pj4g
U2lnbmVkLW9mZi1ieTogWW9uZyBaaGFvIDxZb25nLlpoYW9AYW1kLmNvbT4NCj4+PiAtLS0NCj4+
PiAgICAgLi4uL2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jIHwgMzMg
KysrKysrKysrKysrLS0tLS0tLQ0KPj4+ICAgICAuLi4vZHJtL2FtZC9hbWRrZmQva2ZkX2Rldmlj
ZV9xdWV1ZV9tYW5hZ2VyLmggfCAgMyArLQ0KPj4+ICAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfcHJpdi5oICAgICAgICAgfCAgMiArKw0KPj4+ICAgICAzIGZpbGVzIGNoYW5nZWQs
IDI1IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQ0KPj4+DQpbc25pcF0NCj4+PiAgICAg
DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2Vf
cXVldWVfbWFuYWdlci5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9x
dWV1ZV9tYW5hZ2VyLmgNCj4+PiBpbmRleCBlZWQ4Zjk1MGI2NjMuLjk5YzhiMzYzMDFlZiAxMDA2
NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVl
X21hbmFnZXIuaA0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZp
Y2VfcXVldWVfbWFuYWdlci5oDQo+Pj4gQEAgLTE4OCw3ICsxODgsOCBAQCBzdHJ1Y3QgZGV2aWNl
X3F1ZXVlX21hbmFnZXIgew0KPj4+ICAgICAJdW5zaWduZWQgaW50CQkqYWxsb2NhdGVkX3F1ZXVl
czsNCj4+PiAgICAgCXVpbnQ2NF90CQlzZG1hX2JpdG1hcDsNCj4+PiAgICAgCXVpbnQ2NF90CQl4
Z21pX3NkbWFfYml0bWFwOw0KPj4+IC0JdW5zaWduZWQgaW50CQl2bWlkX2JpdG1hcDsNCj4+PiAr
CS8qIHRoZSBwYXNpZCBtYXBwaW5nIGZvciBlYWNoIGtmZCB2bWlkICovDQo+Pj4gKwl1aW50MTZf
dAkJdm1pZF9wYXNpZFtWTUlEX05VTV07DQo+Pj4gICAgIAl1aW50NjRfdAkJcGlwZWxpbmVzX2Fk
ZHI7DQo+Pj4gICAgIAlzdHJ1Y3Qga2ZkX21lbV9vYmoJKnBpcGVsaW5lX21lbTsNCj4+PiAgICAg
CXVpbnQ2NF90CQlmZW5jZV9ncHVfYWRkcjsNCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9wcml2LmgNCj4+PiBpbmRleCAwZDJjN2ZhMWZhNDYuLmEwODAxNTcyMDg0MSAxMDA2NDQNCj4+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oDQo+Pj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaA0KPj4+IEBAIC00Myw2ICs0Myw4
IEBADQo+Pj4gICAgIA0KPj4+ICAgICAjaW5jbHVkZSAiYW1kX3NoYXJlZC5oIg0KPj4+ICAgICAN
Cj4+PiArI2RlZmluZSBWTUlEX05VTSAxNg0KPj4+ICsNCj4+IEFueSBnb29kIHJlYXNvbiB3aHkg
dGhpcyBpcyBub3QgZGVmaW5lZCBpbiBrZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuaD8NCj4+IEl0
J3Mgb25seSB1c2VkIHRoZXJlLg0KPiBbeXpdIEl0IGNvdWxkIGJlIHVzZWQgYnkgb3RoZXIgcGxh
Y2VzIGluIHRoZSBmdXR1cmUsIGFzIHRoZXkgdXNlIDE2DQo+IGRpcmVjdGx5IG5vdy4NCg0KQ2Fu
IHlvdSBwb2ludCBvdXQgdGhvc2UgcGxhY2VzPyBBIHF1aWNrIGdyZXAgZm9yIGhhcmQtY29kZWQg
MTYgaW4ga2ZkIA0KZG9lc24ndCBzaG93IHVwIGFueXRoaW5nIFZNSUQtcmVsYXRlZCBvbiBhIGZp
cnN0IGdsYW5jZS4NCg0KUmVnYXJkcywNCiDCoCBGZWxpeA0KDQoNCj4+DQo+Pj4gICAgICNkZWZp
bmUgS0ZEX01BWF9SSU5HX0VOVFJZX1NJWkUJOA0KPj4+ICAgICANCj4+PiAgICAgI2RlZmluZSBL
RkRfU1lTRlNfRklMRV9NT0RFIDA0NDQNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
