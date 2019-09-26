Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99149BFB42
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Sep 2019 00:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79846E046;
	Thu, 26 Sep 2019 22:12:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680048.outbound.protection.outlook.com [40.107.68.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB936E046
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 22:12:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+T3Dp+mO2SuL/0Jn6iSMXCVdLhbjsVT4kkDb6KkDWiOfRHP7lWXDpFfYjrsfJ0qHizTq2LiiQDZDJPIdqNCv4Qxh6Vc8fto6VQd6AV+lhCc8NFrNHCeV4Cx76/vh+TeR+K/S0MnDjeYC42ndmjtx1fowH/BT1QlrXvUiGpwTia2GNqlthgMwAByqz4fg8qFAz05ROFcHNsDfG9aMLogJVC8AQzGYm0OFmpmE3P0f2DlFBX1qz4PSAiIJYoK6CElRP5CQAXiMhf4mt3JMWBWzp72pC8muwI7+vk//swyJhmgFuSxhweCEkQsoT3JD6d5tMmHB06Ju9R1ATMJSB/wNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PD+62J5TbPAmfAlW9619bdrkceXBzjk1daaTcmA0+3g=;
 b=EU1gSS5PmHhZuCVWy+MvysNg0+1s78zL8wkiOJWivHvKL6rZo8zdF2+8T/2ROFzED7R8dOrphSmTwd8eNUjS6PDWTA+pMmVzJIOB92f7wLkqT3oRQndttTx35hXNCc15zXsMgobNsSbO6oZhk6t1quZbkLIs+h/FRrlvvp1oIjUnCukXJ535IWtK3WNZZNedtd450VBCq082z2+jk0hrJ4hAXS2VHN+hHicmuXHidZPvsYezAM6EFaR+jVzg8l3Ue0g3Z25TnCzI/PHmsSbOTd71ERzVu55fTuNfGRLxN9f6d9f3L0grBXj8th6gqhtBVl8bx/z5vr8NVe2yLtPGyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB2892.namprd12.prod.outlook.com (20.179.71.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Thu, 26 Sep 2019 22:11:59 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 22:11:59 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdkfd: Query vmid pasid mapping through stored
 info for non HWS
Thread-Topic: [PATCH 2/2] drm/amdkfd: Query vmid pasid mapping through stored
 info for non HWS
Thread-Index: AQHVdLEqMhz3ZnYETkOL3k0d2Dkq9ac+ei2AgAALRAA=
Date: Thu, 26 Sep 2019 22:11:59 +0000
Message-ID: <18960ea3-15eb-53c8-0766-cba278f537fe@amd.com>
References: <20190926212640.28989-1-Yong.Zhao@amd.com>
 <20190926212640.28989-2-Yong.Zhao@amd.com>
 <56a5fc99-0fd7-0194-a4e9-f533207adc6b@amd.com>
In-Reply-To: <56a5fc99-0fd7-0194-a4e9-f533207adc6b@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::48) To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c76794c2-2897-4246-ff62-08d742ce8ce8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB2892; 
x-ms-traffictypediagnostic: DM6PR12MB2892:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2892931B0BF58A2F6EBE21B0F0860@DM6PR12MB2892.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(199004)(189003)(66066001)(3846002)(11346002)(52116002)(66446008)(26005)(7736002)(31696002)(186003)(64756008)(66556008)(66946007)(66476007)(86362001)(14454004)(305945005)(99286004)(6436002)(6512007)(76176011)(2501003)(6246003)(110136005)(14444005)(53546011)(25786009)(71190400001)(229853002)(102836004)(6486002)(36756003)(2906002)(316002)(81156014)(478600001)(71200400001)(5660300002)(256004)(31686004)(8676002)(6506007)(386003)(486006)(6116002)(8936002)(81166006)(2616005)(446003)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2892;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Bs2VHrZMkeBFnjsdyuJcMtCVAvx4Mmk+hNgZFeiuNJiEhMMwbYUSmMzv7VXvZKnFJUzVTCYOMXA994/VWWylHpJbPJyZBFASogU+iEJ6WpOLS/85iei0WSIMePAGtWwwP/g/bi6/fFJsykuY73AGgTf3fuVhw/kOsslRkzG0RyQILprEkCOXQx/zbNkP54jwpjRkkDGoeIBngbotUrheGFqlUy/eMBQOaQeCDovU5zrWSdIePAQOKrjyKsw0ZhssRrCrsfLpd8L+xICnexYbKFmGI4Af9dXs3QRYq56l8U+zugOpTwgDfWbcVrKxVAi6bdbtRUOliG5/rXdWOMJt56el9AosRn62LaATMyyyzaN/mzzXe0promFznIBRwNNgjFRvsWziLgl4y/JFGCjaqFm6lgbfz+WgkWSd2Kai+jY=
Content-ID: <7FEA9BCD7A0AEF42BDA051ADD8FA85C3@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c76794c2-2897-4246-ff62-08d742ce8ce8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 22:11:59.2989 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MNp1pCzBCc6CKJ1kSFyzbi6b7WxWLCRjPk3fL/iPTjq7JqKxGzfEZreez6OboK4Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2892
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PD+62J5TbPAmfAlW9619bdrkceXBzjk1daaTcmA0+3g=;
 b=hMqjJWcbS6crEGUGtOe6jomlzh+ZHKbOlD/EhEKEIxrnI32IAnjkNccSdl2PPRzG4Mvm3JFQaKREd4+qTHNQljSo9JIQViGXLtuaCNFXLRZGz7w/MQdBuvjHn8tMQTEE5EXqkJ249lJpl/gOca6LueszSQFvf5p1y9XlJtDV+3E=
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

T2theSwgSSB3aWxsIGRlbGV0ZSB0aGF0IG1lc3NhZ2UuDQoNCllvbmcNCg0KT24gMjAxOS0wOS0y
NiA1OjMxIHAubS4sIEt1ZWhsaW5nLCBGZWxpeCB3cm90ZToNCj4gT24gMjAxOS0wOS0yNiA1OjI3
IHAubS4sIFpoYW8sIFlvbmcgd3JvdGU6DQo+PiBCZWNhdXNlIHdlIHJlY29yZCB0aGUgbWFwcGlu
ZyB1bmRlciBub24gSFdTIG1vZGUgaW4gdGhlIHNvZnR3YXJlLA0KPj4gd2UgY2FuIHF1ZXJ5IHBh
c2lkIHRocm91Z2ggdm1pZCB1c2luZyB0aGUgc3RvcmVkIG1hcHBpbmcgaW5zdGVhZCBvZg0KPj4g
cmVhZGluZyBmcm9tIEFUQyByZWdpc3RlcnMuDQo+Pg0KPj4gVGhpcyBhbHNvIHByZXBhcmVzIGZv
ciB0aGUgZGVmZWF0dXJlZCBBVEMgYmxvY2sgaW4gZnV0dXJlIEFTSUNzLg0KPj4NCj4+IENoYW5n
ZS1JZDogSTc4MWNiOWQzMGRjMGNjOTMzNzk5MDhmZjFjZjhkYTc5OGJiMjZmMTMNCj4+IFNpZ25l
ZC1vZmYtYnk6IFlvbmcgWmhhbyA8WW9uZy5aaGFvQGFtZC5jb20+DQo+PiAtLS0NCj4+ICAgIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9pbnRfcHJvY2Vzc192OS5jIHwgNCArKy0tDQo+
PiAgICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4N
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW50X3Byb2Nl
c3NfdjkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9pbnRfcHJvY2Vzc192OS5j
DQo+PiBpbmRleCBhYjhhNjk1YzRhM2MuLjlmZmYwMWMwZmI5ZSAxMDA2NDQNCj4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9pbnRfcHJvY2Vzc192OS5jDQo+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW50X3Byb2Nlc3NfdjkuYw0KPj4gQEAgLTU4
LDggKzU4LDggQEAgc3RhdGljIGJvb2wgZXZlbnRfaW50ZXJydXB0X2lzcl92OShzdHJ1Y3Qga2Zk
X2RldiAqZGV2LA0KPj4gICAgCQltZW1jcHkocGF0Y2hlZF9paHJlLCBpaF9yaW5nX2VudHJ5LA0K
Pj4gICAgCQkJCWRldi0+ZGV2aWNlX2luZm8tPmloX3JpbmdfZW50cnlfc2l6ZSk7DQo+PiAgICAN
Cj4+IC0JCXBhc2lkID0gZGV2LT5rZmQya2dkLT5nZXRfYXRjX3ZtaWRfcGFzaWRfbWFwcGluZ19w
YXNpZCgNCj4+IC0JCQkJZGV2LT5rZ2QsIHZtaWQpOw0KPj4gKwkJcGFzaWQgPSBkZXYtPmRxbS0+
dm1pZF9wYXNpZFt2bWlkXTsNCj4+ICsJCVdBUk5fT05DRShwYXNpZCA9PSAwLCAiTm8gUEFTSUQg
YXNzaWduZWQgZm9yIFZNSUQgJWRcbiIsIHZtaWQpOw0KPiBXaGVuIHRoaXMgaGFwcGVucywgeW91
J2xsIG5vdyBnZXQgdG8gV0FSTl9PTkNFIG1lc3NhZ2VzLiBPbmUgaGVyZSBhbmQNCj4gdGhlbiB0
aGUgb25lIGEgZmV3IGxpbmVzIGxvd2VyOiBXQVJOX09OQ0UocGFzaWQgPT0gMCwgIkJ1ZzogTm8g
UEFTSUQgaW4NCj4gS0ZEIGludGVycnVwdCIpLiBNeSBwb2ludCB3YXMsIHlvdXIgbWVzc2FnZXMg
aXMgcmVkdW5kYW50LiBUaGUgb3JpZ2luYWwNCj4gV0FSTl9PTkNFIGFscmVhZHkgY292ZXJzIGJv
dGggdGhlIEhXUyBhbmQgbm9uLUhXUyBjYXNlcy4NCj4NCj4gUmVnYXJkcywNCj4gICDCoCBGZWxp
eA0KPg0KPj4gICAgDQo+PiAgICAJCS8qIFBhdGNoIHRoZSBwYXNpZCBmaWVsZCAqLw0KPj4gICAg
CQlwYXRjaGVkX2locmVbM10gPSBjcHVfdG9fbGUzMigobGUzMl90b19jcHUocGF0Y2hlZF9paHJl
WzNdKQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
