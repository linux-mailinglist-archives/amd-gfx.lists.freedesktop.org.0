Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BC78CDB6
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 10:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D32F6E2BA;
	Wed, 14 Aug 2019 08:11:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710071.outbound.protection.outlook.com [40.107.71.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400286E2BA
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 08:11:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cGONYaXVmOlyuAcm5SpwYxh+SXF2WjSKwsLL7RXknFR6cUn9+leMf0cwtXNv7uqcLbQ+XYtpHWiOiF22yHPKgjh6yePqHIv1PishVDGiK3cL0iLUgFrVtxDeTOpYJjT43eQIm9r065MbBDDLhXjhGOmMkNxB6GaIs7pWpYjDpaPv1XUUMDgtsISvsI4eesH6EIUD1ofIqBFkVGHACjwqU8j2mpH41D9NmbRoQ/oGWQ1pvkmylDQnBqmUsVY5oHxUL7m94d1dmoB2rEWJ3eG8hA/iIv7IcTlh9g7kq+adD+jNZRLyvsMUpJdfoFviv+JFAtn2KGinLZJf4xEQhYOmSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQH2OghEZMgFWaktKF/rsa6q/TRoEgRuJjaQyB5796E=;
 b=UB4BFmTZyly7pCtQW6JQRp2Vb/CiAnXlglKO5wGM6k8gZq+f3HhNINAukZB0zhUnK418PlkqE08NJpNOyot1ehttgC7VTlm8vsGGisOvptO1RyleG9w398y0ZKGU/x1mUH6FqW3yHOOktvdVvjDFOoa4ZKfNYzD0t6qN5NIGDnbpEHWmFmSmdia9LMoKC1xpMSnOzZCPFCw2KWirA1CdHhPL5WcLtyi5gairzBZ5XhU3ksKlZZyTVATJEEl0k8jQSeflNIiOAkEOppJVbw6dFbyPz26CCpcXiVM013lb+HvIc3ThGerD0vElDjmSahtgAFd+6Vj+ntwjceJQFCKCxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1785.namprd12.prod.outlook.com (10.175.87.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.21; Wed, 14 Aug 2019 08:11:37 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 08:11:37 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdkfd/gfx10: Calling amdgpu functions to
 invalidate TLB
Thread-Topic: [PATCH 2/2] drm/amdkfd/gfx10: Calling amdgpu functions to
 invalidate TLB
Thread-Index: AQHVTmn5G4lgXUe5nkaJXe5K9wu61Kb6UueA
Date: Wed, 14 Aug 2019 08:11:37 +0000
Message-ID: <99dc86a3-7a98-2f99-3d59-a78854b049f8@amd.com>
References: <1565324504-4445-1-git-send-email-Oak.Zeng@amd.com>
 <1565324504-4445-2-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1565324504-4445-2-git-send-email-Oak.Zeng@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR1PR01CA0020.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::33) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b423491-1eb1-4ac8-c20d-08d7208f078d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1785; 
x-ms-traffictypediagnostic: DM5PR12MB1785:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB17855F3B9B444508BF7F223E83AD0@DM5PR12MB1785.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(189003)(199004)(2501003)(54906003)(65806001)(71190400001)(6512007)(81166006)(110136005)(31686004)(2906002)(25786009)(71200400001)(99286004)(8676002)(66574012)(81156014)(86362001)(478600001)(6436002)(229853002)(8936002)(6116002)(31696002)(6486002)(53936002)(65956001)(6246003)(7736002)(14454004)(186003)(76176011)(102836004)(305945005)(446003)(66556008)(64756008)(66446008)(486006)(11346002)(46003)(4326008)(476003)(2616005)(316002)(58126008)(256004)(14444005)(6506007)(5660300002)(386003)(66476007)(65826007)(66946007)(64126003)(52116002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1785;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iFbawlhmd77a8r8I4HrKz240NEwz52lI0bK70x7Hz/ztCaBviGKOq5cyNr76YDU4NLwRZTENpx70JJ94CV3UzQIDQbyJNG8f65KxuXvVD1qJD4c9tCi8ZlN+36ODLT595W9KDAFxU4OUmJ5NUsWPlwfxzlz5DYgdLgaYDU6K5h15QE3oozawXhFEKQ3u4QeIsUeiE+13UgG0dVqw0agP7YUkhA2ScWw6IV6U+lZ2cHjt5CZJIne5suloXGfqFuJseec/0P59edOfb/5Xniij8hgdvcGb2oEC1bSXCvodg7dHgKHnTbrByApIWKr1KOfIe2Oocl5cYJu0AZxxcE0fLhnJLuNUdp+L4UYaW9DMw5Q/dAw0VN8riI6HDMl5/okCZ3CeLDRZAek9BZmwjseSUEMiA59pxqZevUIX8uLZNYE=
Content-ID: <2E09A2630BE69A46AFAB00F04E6A72CD@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b423491-1eb1-4ac8-c20d-08d7208f078d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 08:11:37.7046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bwYOvF8PGtipEmGH8ML6m7pKIcsWhZsQLZ1hLhA4kxE/e0h3i8XoqblvDRCaYlCX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1785
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQH2OghEZMgFWaktKF/rsa6q/TRoEgRuJjaQyB5796E=;
 b=amtXXeMOrWFzTh0SVBrQmX4x2+sW7YT2AUZ5+bliaWTUJ9i3ahJa57Lp2Wo1h3KUVw3Oa8+2GgFtb3TvtBzFAeNlhu7CV9I4gO9L+yvEexCy/N2Jd/pz9BnuXjy1SP2esxUy1im6w01unzJmQmgPjid7HXmdQrTvJuabNbyG+jI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDkuMDguMTkgdW0gMDY6MjEgc2NocmllYiBaZW5nLCBPYWs6DQo+IENhbGxpbmcgYW1kZ3B1
IGZ1bmN0aW9uIHRvIGludmFsaWRhdGUgVExCLCBpbnN0ZWFkIG9mIHVzaW5nIGENCj4ga2ZkIGlt
cGxlbWVudGF0aW9uLiBEZWxldGUgdGhlIGtmZCBsb2NhbCBUTEIgaW52YWxpZGF0aW9uDQo+IGlt
cGxlbWVudGF0aW9uLg0KPg0KPiBDaGFuZ2UtSWQ6IElhMTZmY2Y5MDkxYTkzYjhjMGFjZGFmOTk4
MWY4YTVhMWY5YTVjYTFkDQo+IFNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQu
Y29tPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9h
bWRrZmRfZ2Z4X3YxMC5jIHwgNDEgKystLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDM4IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9nZnhfdjEwLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92MTAuYw0KPiBpbmRl
eCAzOWZmYjA3Li4zYWZmMmI1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92MTAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92MTAuYw0KPiBAQCAtODAyLDQyICs4MDIsNiBAQCBz
dGF0aWMgdWludDE2X3QgZ2V0X2F0Y192bWlkX3Bhc2lkX21hcHBpbmdfcGFzaWQoc3RydWN0IGtn
ZF9kZXYgKmtnZCwNCj4gICAJcmV0dXJuIHJlZyAmIEFUQ19WTUlEMF9QQVNJRF9NQVBQSU5HX19Q
QVNJRF9NQVNLOw0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyB2b2lkIHdyaXRlX3ZtaWRfaW52YWxp
ZGF0ZV9yZXF1ZXN0KHN0cnVjdCBrZ2RfZGV2ICprZ2QsIHVpbnQ4X3Qgdm1pZCkNCj4gLXsNCj4g
LQlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKSBr
Z2Q7DQo+IC0JdWludDMyX3QgcmVxID0gKDEgPDwgdm1pZCkgfA0KPiAtCQkoMCA8PCBHQ1ZNX0lO
VkFMSURBVEVfRU5HMF9SRVFfX0ZMVVNIX1RZUEVfX1NISUZUKSB8LyogbGVnYWN5ICovDQo+IC0J
CUdDVk1fSU5WQUxJREFURV9FTkcwX1JFUV9fSU5WQUxJREFURV9MMl9QVEVTX01BU0sgfA0KPiAt
CQlHQ1ZNX0lOVkFMSURBVEVfRU5HMF9SRVFfX0lOVkFMSURBVEVfTDJfUERFMF9NQVNLIHwNCj4g
LQkJR0NWTV9JTlZBTElEQVRFX0VORzBfUkVRX19JTlZBTElEQVRFX0wyX1BERTFfTUFTSyB8DQo+
IC0JCUdDVk1fSU5WQUxJREFURV9FTkcwX1JFUV9fSU5WQUxJREFURV9MMl9QREUyX01BU0sgfA0K
PiAtCQlHQ1ZNX0lOVkFMSURBVEVfRU5HMF9SRVFfX0lOVkFMSURBVEVfTDFfUFRFU19NQVNLOw0K
PiAtDQo+IC0JbXV0ZXhfbG9jaygmYWRldi0+c3JibV9tdXRleCk7DQo+IC0NCj4gLQkvKiBVc2Ug
bGlnaHQgd2VpZ2h0IGludmFsaWRhdGlvbi4NCj4gLQkgKg0KPiAtCSAqIFRPRE8gMTogYWdyZWUg
b24gdGhlIHJpZ2h0IHNldCBvZiBpbnZhbGlkYXRpb24gcmVnaXN0ZXJzIGZvcg0KPiAtCSAqIEtG
RCB1c2UuIFVzZSB0aGUgbGFzdCBvbmUgZm9yIG5vdy4gSW52YWxpZGF0ZSBvbmx5IEdDSFVCIGFz
DQo+IC0JICogU0RNQSBpcyBub3cgbW92ZWQgdG8gR0NIVUINCj4gLQkgKg0KPiAtCSAqIFRPRE8g
Mjogc3VwcG9ydCByYW5nZS1iYXNlZCBpbnZhbGlkYXRpb24sIHJlcXVpcmVzIGtmZzJrZ2QNCj4g
LQkgKiBpbnRlcmZhY2UgY2hhbmdlDQo+IC0JICovDQo+IC0JV1JFRzMyKFNPQzE1X1JFR19PRkZT
RVQoR0MsIDAsIG1tR0NWTV9JTlZBTElEQVRFX0VORzBfQUREUl9SQU5HRV9MTzMyKSwNCj4gLQkJ
CQkweGZmZmZmZmZmKTsNCj4gLQlXUkVHMzIoU09DMTVfUkVHX09GRlNFVChHQywgMCwgbW1HQ1ZN
X0lOVkFMSURBVEVfRU5HMF9BRERSX1JBTkdFX0hJMzIpLA0KPiAtCQkJCTB4MDAwMDAwMWYpOw0K
PiAtDQo+IC0JV1JFRzMyKFNPQzE1X1JFR19PRkZTRVQoR0MsIDAsIG1tR0NWTV9JTlZBTElEQVRF
X0VORzBfUkVRKSwgcmVxKTsNCj4gLQ0KPiAtCXdoaWxlICghKFJSRUczMihTT0MxNV9SRUdfT0ZG
U0VUKEdDLCAwLCBtbUdDVk1fSU5WQUxJREFURV9FTkcwX0FDSykpICYNCj4gLQkJCQkJKDEgPDwg
dm1pZCkpKQ0KPiAtCQljcHVfcmVsYXgoKTsNCj4gLQ0KPiAtCW11dGV4X3VubG9jaygmYWRldi0+
c3JibV9tdXRleCk7DQo+IC19DQo+IC0NCj4gICBzdGF0aWMgaW50IGludmFsaWRhdGVfdGxic193
aXRoX2tpcShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDE2X3QgcGFzaWQpDQo+ICAg
ew0KPiAgIAlzaWduZWQgbG9uZyByOw0KPiBAQCAtODc4LDcgKzg0Miw4IEBAIHN0YXRpYyBpbnQg
aW52YWxpZGF0ZV90bGJzKHN0cnVjdCBrZ2RfZGV2ICprZ2QsIHVpbnQxNl90IHBhc2lkKQ0KPiAg
IAkJaWYgKGdldF9hdGNfdm1pZF9wYXNpZF9tYXBwaW5nX3ZhbGlkKGtnZCwgdm1pZCkpIHsNCj4g
ICAJCQlpZiAoZ2V0X2F0Y192bWlkX3Bhc2lkX21hcHBpbmdfcGFzaWQoa2dkLCB2bWlkKQ0KPiAg
IAkJCQk9PSBwYXNpZCkgew0KPiAtCQkJCXdyaXRlX3ZtaWRfaW52YWxpZGF0ZV9yZXF1ZXN0KGtn
ZCwgdm1pZCk7DQo+ICsJCQkJYW1kZ3B1X2dtY19mbHVzaF9ncHVfdGxiKGFkZXYsIHZtaWQsDQo+
ICsJCQkJCQlBTURHUFVfR0ZYSFVCXzAsIDApOw0KPiAgIAkJCQlicmVhazsNCj4gICAJCQl9DQo+
ICAgCQl9DQo+IEBAIC04OTYsNyArODYxLDcgQEAgc3RhdGljIGludCBpbnZhbGlkYXRlX3RsYnNf
dm1pZChzdHJ1Y3Qga2dkX2RldiAqa2dkLCB1aW50MTZfdCB2bWlkKQ0KPiAgIAkJcmV0dXJuIDA7
DQo+ICAgCX0NCj4gICANCj4gLQl3cml0ZV92bWlkX2ludmFsaWRhdGVfcmVxdWVzdChrZ2QsIHZt
aWQpOw0KPiArCWFtZGdwdV9nbWNfZmx1c2hfZ3B1X3RsYihhZGV2LCB2bWlkLCBBTURHUFVfR0ZY
SFVCXzAsIDApOw0KPiAgIAlyZXR1cm4gMDsNCj4gICB9DQo+ICAgDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
