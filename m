Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF47CBF9BB
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 21:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E84E6EDEE;
	Thu, 26 Sep 2019 19:01:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710083.outbound.protection.outlook.com [40.107.71.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF146EDEE
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 19:01:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8YLUFWNoF9SB1FxNXz80SnDKjQ8Gp6+q/nwnuop4EevilBM+PZFnrgLCpjqQ7MzQZzFT+L/C90L/paWkyY22T1rLkINspx6Pld6S815AePouUdd8E2cc+qRbfIFUw4m74MrxOaI9BCZxDB9JYayZtJ3OfnmKrrPCCHK4WfathjWwO1Qp3HqynvDfC4ogyp7bKb62bnGvV3v0n/Tmpw0LrkCpe5Kru3ew3r76n9oZjIms58f+SaR2+RiwabSExZAO/ztc8QEZl58YT0FFWNnVOae1a/U3XxJcHBcHDmAKPkPMwaNxjKwLpOi3BUts8rgI+qE6jWTBRt09wpk4PL9mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPeUAJZ35vK6kmH0uUV8BjNHK/9aYNp55QOsm5rJUbk=;
 b=LD69F8LlMD99GUdVaOsYPDS1ls4Gmkw3PktoYKnEHtORQ89veR3hCxFmc1UorKHqHZeqvRHvndYlClgtYODsFLpBMhD4qPN8TQcAb+VKJB0kMRKpWd+1+cuBXYSj3oBWDL3p43Dk/Kk9StFlQSmEwLcc7lwBbblRIcOTIEr3ac8NM36PnFDpDiFYIuPpOyOQoWcCzWQmjYytxpOznp9D1U/KlWmhfVqw5epI45m0LlX3t0SCUP2XWOT4YjCrHLPDmTDW5kbCYizrNs0Zt5Y1l4mktmUfPnqqWp6h62vypsQ5jjgOfbwhkKs1LyOCwFHDORJWxSVbBJyTVksA93hFAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB4138.namprd12.prod.outlook.com (10.141.8.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Thu, 26 Sep 2019 19:01:17 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 19:01:17 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 4/6] drm/amdkfd: Record vmid pasid mapping in the driver
Thread-Topic: [PATCH 4/6] drm/amdkfd: Record vmid pasid mapping in the driver
Thread-Index: AQHVdJmiJHW7pe1IjE+dvaqHmLzZQac+TnQAgAAB44A=
Date: Thu, 26 Sep 2019 19:01:17 +0000
Message-ID: <90b14299-2405-5dd1-b1d3-f408619cef44@amd.com>
References: <20190926183826.18813-1-Yong.Zhao@amd.com>
 <20190926183826.18813-4-Yong.Zhao@amd.com>
 <cc578b05-a918-2c5f-d6ac-122f24d763ce@amd.com>
In-Reply-To: <cc578b05-a918-2c5f-d6ac-122f24d763ce@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0042.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::19) To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5b42b33-bd3d-4f36-a9c6-08d742b3e8f9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB4138; 
x-ms-traffictypediagnostic: DM6PR12MB4138:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB413839E6ABDBB9D74FFC45C1F0860@DM6PR12MB4138.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(199004)(189003)(66946007)(66556008)(64756008)(66476007)(3846002)(6116002)(14454004)(446003)(11346002)(486006)(66446008)(476003)(76176011)(478600001)(52116002)(26005)(2616005)(53546011)(6506007)(25786009)(102836004)(386003)(6486002)(6512007)(229853002)(6436002)(6246003)(71190400001)(2501003)(256004)(14444005)(81166006)(71200400001)(81156014)(8936002)(8676002)(31686004)(31696002)(316002)(99286004)(110136005)(7736002)(305945005)(36756003)(186003)(2906002)(86362001)(66066001)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4138;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RAso4DLzj8zktPz4Sj/EBvXLKhhPwJiHyNivgSZECTo2X2nQl+mdQ2DVcUlt7/gtyZ25kGfGG9MFB02+bosYdi4N3Hx3ItZTZIUWGXCY6kyZ/FrPDOEKw8/iThNeEe0UR7TeWorNV7dngyjrkEJTngQYMFAlsH8OdZ5/QjHLeC0RRrG2CCGS/9o10sGJz11I3Bs/gPw9vf/5cKHn49RUl4m6lwgriv9OjL69epOosyBtod60Xib+hdUaTX+jcI9LFIBBynkli8sATfprR74IRWmcZpMZiXHxXebepVcPdfgpaEu3ekjwTkHJxwBsSxuHznm+bKQhTFh3DJK3OsOR1mjaLSi0RMmkWuB/YEsgZLJMeyh3PhBCPzWC5keXJuUIDLKNKTtef4yl1IpzKjZ8ZMy/1hPw/tYcm7S61sr9IgY=
Content-ID: <E4C3C966C4B7A3419D362AD4E76CCF1D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b42b33-bd3d-4f36-a9c6-08d742b3e8f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 19:01:17.3318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zAL7mcL46fdK73PlDot4EqnCnxVAAiB7j/vjqwvjGZ1W1R0J3PZjRhUVEU4HQrgY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4138
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPeUAJZ35vK6kmH0uUV8BjNHK/9aYNp55QOsm5rJUbk=;
 b=O0jnM/7UewmiVeysmYtw4BicfE+kqVm9Q/2DqNJY3XKOPhMMamvT+oHZq8xURXpDgOhUbCGayeHZn0CAe2Hoc0xWUDR19ygMIk8w9xvgs85BHkOeoaWR/Y0R2H/xbR/9a+qa3yOeKIbf8czb8XVWU1of/6Di2SyECWf1Zfe69+M=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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

SSBhZ3JlZS4NCg0KWW9uZw0KDQpPbiAyMDE5LTA5LTI2IDI6NTQgcC5tLiwgS3VlaGxpbmcsIEZl
bGl4IHdyb3RlOg0KPiBPbiAyMDE5LTA5LTI2IDI6MzggcC5tLiwgWmhhbywgWW9uZyB3cm90ZToN
Cj4+IFRoaXMgbWFrZXMgcG9zc2libGUgdGhlIHZtaWQgcGFzaWQgbWFwcGluZyBxdWVyeSB0aHJv
dWdoIHNvZnR3YXJlLg0KPj4NCj4+IENoYW5nZS1JZDogSWI1MzlhYWUyNzdhMjI3Y2MzOWY2NDY5
YWUyM2M0NmM0ZDI4OWI4N2INCj4+IFNpZ25lZC1vZmYtYnk6IFlvbmcgWmhhbyA8WW9uZy5aaGFv
QGFtZC5jb20+DQo+PiAtLS0NCj4+ICAgIC4uLi9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1
ZXVlX21hbmFnZXIuYyB8IDM0ICsrKysrKysrKysrKystLS0tLS0NCj4+ICAgIC4uLi9kcm0vYW1k
L2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuaCB8ICAzICstDQo+PiAgICAyIGZpbGVz
IGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFn
ZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdl
ci5jDQo+PiBpbmRleCBlN2YwYTMyZTBlNDQuLmQwMDZhZGVmZWY1NSAxMDA2NDQNCj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQo+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFn
ZXIuYw0KPj4gQEAgLTIyNCwyMCArMjI0LDMwIEBAIHN0YXRpYyBpbnQgYWxsb2NhdGVfdm1pZChz
dHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCj4+ICAgIAkJCXN0cnVjdCBxY21fcHJv
Y2Vzc19kZXZpY2UgKnFwZCwNCj4+ICAgIAkJCXN0cnVjdCBxdWV1ZSAqcSkNCj4+ICAgIHsNCj4+
IC0JaW50IGJpdCwgYWxsb2NhdGVkX3ZtaWQ7DQo+PiArCWludCBpZHggPSAtMSwgYWxsb2NhdGVk
X3ZtaWQsIGk7DQo+PiAgICANCj4+IC0JaWYgKGRxbS0+dm1pZF9iaXRtYXAgPT0gMCkNCj4+ICsJ
Zm9yIChpID0gMDsgaSA8IGRxbS0+ZGV2LT52bV9pbmZvLnZtaWRfbnVtX2tmZDsgaSsrKSB7DQo+
PiArCQlpZiAoIWRxbS0+dm1pZF9wYXNpZFtpXSkgew0KPj4gKwkJCWlkeCA9IGk7DQo+PiArCQkJ
YnJlYWs7DQo+PiArCQl9DQo+PiArCX0NCj4+ICsNCj4+ICsJaWYgKGlkeCA8IDApIHsNCj4+ICsJ
CXByX2Vycigibm8gbW9yZSB2bWlkIHRvIGFsbG9jYXRlXG4iKTsNCj4+ICAgIAkJcmV0dXJuIC1F
Tk9NRU07DQo+PiArCX0NCj4+ICsNCj4+ICsJZHFtLT52bWlkX3Bhc2lkW2lkeF0gPSBxLT5wcm9j
ZXNzLT5wYXNpZDsNCj4+ICAgIA0KPj4gLQliaXQgPSBmZnMoZHFtLT52bWlkX2JpdG1hcCkgLSAx
Ow0KPj4gLQlkcW0tPnZtaWRfYml0bWFwICY9IH4oMSA8PCBiaXQpOw0KPj4gKwlhbGxvY2F0ZWRf
dm1pZCA9IGlkeCArIGRxbS0+ZGV2LT52bV9pbmZvLmZpcnN0X3ZtaWRfa2ZkOw0KPj4gKwlwcl9k
ZWJ1Zygidm1pZCBhbGxvY2F0ZWQ6ICVkXG4iLCBhbGxvY2F0ZWRfdm1pZCk7DQo+PiArDQo+PiAr
CXNldF9wYXNpZF92bWlkX21hcHBpbmcoZHFtLCBxLT5wcm9jZXNzLT5wYXNpZCwgYWxsb2NhdGVk
X3ZtaWQpOw0KPj4gICAgDQo+PiAtCWFsbG9jYXRlZF92bWlkID0gYml0ICsgZHFtLT5kZXYtPnZt
X2luZm8uZmlyc3Rfdm1pZF9rZmQ7DQo+PiAtCXByX2RlYnVnKCJ2bWlkIGFsbG9jYXRpb24gJWRc
biIsIGFsbG9jYXRlZF92bWlkKTsNCj4+ICAgIAlxcGQtPnZtaWQgPSBhbGxvY2F0ZWRfdm1pZDsN
Cj4+ICAgIAlxLT5wcm9wZXJ0aWVzLnZtaWQgPSBhbGxvY2F0ZWRfdm1pZDsNCj4+ICAgIA0KPj4g
LQlzZXRfcGFzaWRfdm1pZF9tYXBwaW5nKGRxbSwgcS0+cHJvY2Vzcy0+cGFzaWQsIHEtPnByb3Bl
cnRpZXMudm1pZCk7DQo+PiAgICAJcHJvZ3JhbV9zaF9tZW1fc2V0dGluZ3MoZHFtLCBxcGQpOw0K
Pj4gICAgDQo+PiAgICAJLyogcXBkLT5wYWdlX3RhYmxlX2Jhc2UgaXMgc2V0IGVhcmxpZXIgd2hl
biByZWdpc3Rlcl9wcm9jZXNzKCkNCj4+IEBAIC0yNzgsNyArMjg4LDcgQEAgc3RhdGljIHZvaWQg
ZGVhbGxvY2F0ZV92bWlkKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLA0KPj4gICAg
CQkJCXN0cnVjdCBxY21fcHJvY2Vzc19kZXZpY2UgKnFwZCwNCj4+ICAgIAkJCQlzdHJ1Y3QgcXVl
dWUgKnEpDQo+PiAgICB7DQo+PiAtCWludCBiaXQgPSBxcGQtPnZtaWQgLSBkcW0tPmRldi0+dm1f
aW5mby5maXJzdF92bWlkX2tmZDsNCj4+ICsJaW50IGlkeDsNCj4+ICAgIA0KPj4gICAgCS8qIE9u
IEdGWCB2NywgQ1AgZG9lc24ndCBmbHVzaCBUQyBhdCBkZXF1ZXVlICovDQo+PiAgICAJaWYgKHEt
PmRldmljZS0+ZGV2aWNlX2luZm8tPmFzaWNfZmFtaWx5ID09IENISVBfSEFXQUlJKQ0KPj4gQEAg
LTI5MCw3ICszMDAsOSBAQCBzdGF0aWMgdm9pZCBkZWFsbG9jYXRlX3ZtaWQoc3RydWN0IGRldmlj
ZV9xdWV1ZV9tYW5hZ2VyICpkcW0sDQo+PiAgICAJLyogUmVsZWFzZSB0aGUgdm1pZCBtYXBwaW5n
ICovDQo+PiAgICAJc2V0X3Bhc2lkX3ZtaWRfbWFwcGluZyhkcW0sIDAsIHFwZC0+dm1pZCk7DQo+
PiAgICANCj4+IC0JZHFtLT52bWlkX2JpdG1hcCB8PSAoMSA8PCBiaXQpOw0KPj4gKwlpZHggPSBx
cGQtPnZtaWQgLSBkcW0tPmRldi0+dm1faW5mby5maXJzdF92bWlkX2tmZDsNCj4+ICsJZHFtLT52
bWlkX3Bhc2lkW2lkeF0gPSAwOw0KPj4gKw0KPj4gICAgCXFwZC0+dm1pZCA9IDA7DQo+PiAgICAJ
cS0+cHJvcGVydGllcy52bWlkID0gMDsNCj4+ICAgIH0NCj4+IEBAIC0xMDE3LDcgKzEwMjksOCBA
QCBzdGF0aWMgaW50IGluaXRpYWxpemVfbm9jcHNjaChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFn
ZXIgKmRxbSkNCj4+ICAgIAkJCQlkcW0tPmFsbG9jYXRlZF9xdWV1ZXNbcGlwZV0gfD0gMSA8PCBx
dWV1ZTsNCj4+ICAgIAl9DQo+PiAgICANCj4+IC0JZHFtLT52bWlkX2JpdG1hcCA9ICgxIDw8IGRx
bS0+ZGV2LT52bV9pbmZvLnZtaWRfbnVtX2tmZCkgLSAxOw0KPj4gKwlkcW0tPnZtaWRfcGFzaWQg
PSBrY2FsbG9jKGRxbS0+ZGV2LT52bV9pbmZvLnZtaWRfbnVtX2tmZCwNCj4+ICsJCQlzaXplb2Yo
dWludDE2X3QpLCBHRlBfS0VSTkVMKTsNCj4gSWYgeW91IGFsbG9jYXRlIHRoaXMgZHluYW1pY2Fs
bHksIHlvdSBuZWVkIHRvIGNoZWNrIHRoZSByZXR1cm4gdmFsdWUuDQo+IEJ1dCBzZWUgYmVsb3cg
Li4uDQo+DQo+DQo+PiAgICAJZHFtLT5zZG1hX2JpdG1hcCA9IH4wVUxMID4+ICg2NCAtIGdldF9u
dW1fc2RtYV9xdWV1ZXMoZHFtKSk7DQo+PiAgICAJZHFtLT54Z21pX3NkbWFfYml0bWFwID0gfjBV
TEwgPj4gKDY0IC0gZ2V0X251bV94Z21pX3NkbWFfcXVldWVzKGRxbSkpOw0KPj4gICAgDQo+PiBA
QCAtMTAzMCw2ICsxMDQzLDcgQEAgc3RhdGljIHZvaWQgdW5pbml0aWFsaXplKHN0cnVjdCBkZXZp
Y2VfcXVldWVfbWFuYWdlciAqZHFtKQ0KPj4gICAgDQo+PiAgICAJV0FSTl9PTihkcW0tPnF1ZXVl
X2NvdW50ID4gMCB8fCBkcW0tPnByb2Nlc3Nlc19jb3VudCA+IDApOw0KPj4gICAgDQo+PiArCWtm
cmVlKGRxbS0+dm1pZF9wYXNpZCk7DQo+PiAgICAJa2ZyZWUoZHFtLT5hbGxvY2F0ZWRfcXVldWVz
KTsNCj4+ICAgIAlmb3IgKGkgPSAwIDsgaSA8IEtGRF9NUURfVFlQRV9NQVggOyBpKyspDQo+PiAg
ICAJCWtmcmVlKGRxbS0+bXFkX21ncnNbaV0pOw0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5oIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmgNCj4+IGluZGV4IGVlZDhm
OTUwYjY2My4uNjdiNWU1ZmFkZDk1IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmgNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5oDQo+PiBAQCAtMTg4LDcg
KzE4OCw4IEBAIHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciB7DQo+PiAgICAJdW5zaWduZWQg
aW50CQkqYWxsb2NhdGVkX3F1ZXVlczsNCj4+ICAgIAl1aW50NjRfdAkJc2RtYV9iaXRtYXA7DQo+
PiAgICAJdWludDY0X3QJCXhnbWlfc2RtYV9iaXRtYXA7DQo+PiAtCXVuc2lnbmVkIGludAkJdm1p
ZF9iaXRtYXA7DQo+PiArCS8qIHRoZSBwYXNpZCBtYXBwaW5nIGZvciBlYWNoIGtmZCB2bWlkICov
DQo+PiArCXVpbnQxNl90CQkqdm1pZF9wYXNpZDsNCj4gVGhpcyBjb3VsZCBiZSBhIGZpeGVkLXNp
emUgYXJyYXkgc2luY2UgdGhlIG51bWJlciBvZiB1c2VyIG1vZGUgVk1JRHMgaXMNCj4gbGltaXRl
ZCB0byAxNSBieSB0aGUgSFcuIFRoZSBzaXplIG9mIHRoZSBwb2ludGVyIGFsb25lIGlzIGVub3Vn
aCB0bw0KPiBzdG9yZSA0IFBBU0lEcy4gQWRkIG92ZXJoZWFkIG9mIGttYWxsb2MgYW5kIHlvdSBk
b24ndCByZWFsbHkgc2F2ZQ0KPiBhbnl0aGluZyBieSBhbGxvY2F0aW5nIHRoaXMgZHluYW1pY2Fs
bHkuIEl0IG9ubHkgYWRkcyBpbmRpcmVjdGlvbiwNCj4gY29tcGxleGl0eSAoZXJyb3IgaGFuZGxp
bmcpIGFuZCB0aGUgcmlzayBvZiBtZW1vcnkgbGVha3MuDQo+DQo+IFJlZ2FyZHMsDQo+ICAgwqAg
RmVsaXgNCj4NCj4NCj4+ICAgIAl1aW50NjRfdAkJcGlwZWxpbmVzX2FkZHI7DQo+PiAgICAJc3Ry
dWN0IGtmZF9tZW1fb2JqCSpwaXBlbGluZV9tZW07DQo+PiAgICAJdWludDY0X3QJCWZlbmNlX2dw
dV9hZGRyOw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
