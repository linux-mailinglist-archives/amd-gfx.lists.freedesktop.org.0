Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0A7A84C5
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 16:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89C389225;
	Wed,  4 Sep 2019 14:00:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730064.outbound.protection.outlook.com [40.107.73.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F94D89225
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 14:00:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZn38t+utyEm8OuWylZ3mCZW0amxd7B4WxgpDvJWty3/GWM973/qu83mdYXUF1US5jVabOFI1j1TPcnGDA2sqVpxBJqs4OEQyuYaJEg3HMnNxkOyzU4nP5n81GFtGE+W0MeSjpc5moeQvezJKbDrJ50aqmhh9IuCXwbvdd9Lb6UwuPhOxHdXDUzyZlAOT1f0hWEmoCYNHv1oJ+37l7c8CIBrQf4ci3s9jF2Jen3U69Q9cskdDtjJXTDW36G2EUrIXOjGxNuEFJgYZemv6DfHp0C+2y+izDuXxaOv4zXZ7u7HVc1soLVzY6qLVDWbPtCFdvScOm5DATsljcDmNJDliw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RZPGwyETIJLiHzvOcZ9fL7JMdnuYj75UjZ/GzhwXnA=;
 b=B6GkJsiXBOBsk9prGB9VuTqoKopCcT2QMcYMgAXOk8YdQunmX3esmDCrvqodb8ELeYqZiMH8rWjlGgw0nnt3tAcnCn+5bQqjDqxkJJMFpozmRZIqQBdLNF/ueH0ay7MSsknIAqgtju5h0X72dcaKg9+D1EaybvpEyjKzSDlbYCkHS2SZhqgzTSO0Fx9S7Wf6bboJNYyv55Vzij2+KL+U1N3WKe297LwoFVo25OIpaOq+rsMpRsZMbPNk1P1VnP+h6Ue20VAT8l3fjAkIB0AYTclOCiotvlMjXwgCNGABwY3Q5V/8Z0nzJBObu8TKyVOSawqthvp9fyeyfJsj6RiLsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3998.namprd12.prod.outlook.com (10.255.239.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Wed, 4 Sep 2019 14:00:06 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77%3]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 14:00:06 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amdgpu: cleanup PTE flag generation v2
Thread-Topic: [PATCH 2/2] drm/amdgpu: cleanup PTE flag generation v2
Thread-Index: AQHVYxq6jyZWNA3Ch0u61n2tqkq5g6cbidLA
Date: Wed, 4 Sep 2019 14:00:06 +0000
Message-ID: <MN2PR12MB3309765D0C8DEA4E5596E715ECB80@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <20190904121721.69054-1-christian.koenig@amd.com>
 <20190904121721.69054-2-christian.koenig@amd.com>
In-Reply-To: <20190904121721.69054-2-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a882fbc1-3270-47e0-77ba-08d7314030ff
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3998; 
x-ms-traffictypediagnostic: MN2PR12MB3998:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB399863A00390FE6A69E070ABECB80@MN2PR12MB3998.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(199004)(189003)(13464003)(99286004)(110136005)(6306002)(81166006)(9686003)(53936002)(6436002)(6116002)(66066001)(8936002)(81156014)(55016002)(316002)(8676002)(7736002)(74316002)(52536014)(478600001)(229853002)(256004)(305945005)(25786009)(86362001)(33656002)(14444005)(7696005)(6506007)(53546011)(102836004)(14454004)(26005)(486006)(476003)(186003)(3846002)(71190400001)(2906002)(66946007)(71200400001)(6246003)(76116006)(66556008)(64756008)(66446008)(5660300002)(66476007)(11346002)(446003)(76176011)(2501003)(966005)(66574012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3998;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Dj7WrlI/tPKfMIVx46kr6VhQARkt7aQVLoYvePr7ScDHu7VL07JLO8M49RD3aCDLKRYgkZEVLdU8qVmjGcL7E/k7Ta3QgGM5AzjfTaiHcFt477k82AG0i+A1SXBCk+WAqtw5n3rUOS6JQE0fUTBxJf57t19CX3exvbO6x6c3JwtN9dScTp+F7RBkgifFnMzTpPLsrwDr9T++M1d1T+q37Ujgp1e0CwRcplxmVnGBQ2CPnk3VjaxrOXzcQyT4qvOJ9Z1uUfNNN7NjnRtMx4f3iiCMvFkN2JBcWtKXbfhuNP7AF3/wLpQdxSaZ1pSDEEMvZ+zBNrPhu49PijehR0q8uQvwEX17FYtjqh5pkep2rZ9F/W5Y5rcnaQunav2CoCSs/rX+cXknRLV6e3GXIjxwksPrXsSsswCN4cKGO8EzVZ8=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a882fbc1-3270-47e0-77ba-08d7314030ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 14:00:06.5031 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w/4QajdUX16uQUz3jNwpO0P+4FqtHhbi92zn2c1G+4xEBvcVNv67vVLSCf7dugatwK2qs2nUrWcAHSHydH8E+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3998
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RZPGwyETIJLiHzvOcZ9fL7JMdnuYj75UjZ/GzhwXnA=;
 b=AKuXBU1ru0HFP82/pIHxCGy1oJm7mqT41xNlWzTq+VVFkoz48Wa8byoBCP+sxCZzQESPlidseaFrgWqojo/nE268NXD20Lm0P7Ike787bdf6+wTLk0bN9e0qKQwdL0033OOWiRuQQJzRG93ugweVZmJGzULcYmHaByqKZAdTX0U=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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

U2VyaWVzIGxvb2sgZ29vZCBmb3IgbWUuDQoNClJldmlld2VkLWJ5OiBIdWFuZyBSdWkgPHJheS5o
dWFuZ0BhbWQuY29tPg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdm
eCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIENo
cmlzdGlhbiBLw7ZuaWcNClNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDQsIDIwMTkgODoxNyBB
TQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBbUEFUQ0ggMi8y
XSBkcm0vYW1kZ3B1OiBjbGVhbnVwIFBURSBmbGFnIGdlbmVyYXRpb24gdjINCg0KTW92ZSB0aGUg
QVNJQyBzcGVjaWZpYyBjb2RlIGludG8gYSBuZXcgY2FsbGJhY2sgZnVuY3Rpb24uDQoNCnYyOiBt
YXNrIHRoZSBmbGFncyBmb3IgU0kgYW5kIENJSyBpbnN0ZWFkIG9mIGEgQlVHX09OKCkuDQoNClNp
Z25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4N
Ci0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuaCB8ICA1ICsrKysr
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyAgfCAyOSArKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYyAg
fCAyMiArKysrKysrKysrKysrKysrKystDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21j
X3Y2XzAuYyAgIHwgIDkgKysrKysrKysNCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNf
djdfMC5jICAgfCAxMSArKysrKysrKystDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21j
X3Y4XzAuYyAgIHwgMTMgKysrKysrKysrKy0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjlfMC5jICAgfCAyNCArKysrKysrKysrKysrKysrKysrLQ0KIDcgZmlsZXMgY2hhbmdlZCwg
ODIgaW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZ21jLmgNCmluZGV4IDZhNzQwNTliNzc2Yy4uMjMyYThmZjU2NDJiIDEwMDY0
NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5oDQorKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmgNCkBAIC0xMDQsNiArMTA0LDEw
IEBAIHN0cnVjdCBhbWRncHVfZ21jX2Z1bmNzIHsNCiAJLyogZ2V0IHRoZSBwZGUgZm9yIGEgZ2l2
ZW4gbWMgYWRkciAqLw0KIAl2b2lkICgqZ2V0X3ZtX3BkZSkoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsIGludCBsZXZlbCwNCiAJCQkgICB1NjQgKmRzdCwgdTY0ICpmbGFncyk7DQorCS8qIGdl
dCB0aGUgcHRlIGZsYWdzIHRvIHVzZSBmb3IgYSBCTyBWQSBtYXBwaW5nICovDQorCXZvaWQgKCpn
ZXRfdm1fcHRlKShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCisJCQkgICBzdHJ1Y3QgYW1k
Z3B1X2JvX3ZhX21hcHBpbmcgKm1hcHBpbmcsDQorCQkJICAgdWludDY0X3QgKmZsYWdzKTsNCiB9
Ow0KIA0KIHN0cnVjdCBhbWRncHVfeGdtaSB7DQpAQCAtMTg1LDYgKzE4OSw3IEBAIHN0cnVjdCBh
bWRncHVfZ21jIHsNCiAjZGVmaW5lIGFtZGdwdV9nbWNfZW1pdF9wYXNpZF9tYXBwaW5nKHIsIHZt
aWQsIHBhc2lkKSAociktPmFkZXYtPmdtYy5nbWNfZnVuY3MtPmVtaXRfcGFzaWRfbWFwcGluZygo
ciksICh2bWlkKSwgKHBhc2lkKSkgICNkZWZpbmUgYW1kZ3B1X2dtY19tYXBfbXR5cGUoYWRldiwg
ZmxhZ3MpIChhZGV2KS0+Z21jLmdtY19mdW5jcy0+bWFwX210eXBlKChhZGV2KSwoZmxhZ3MpKQ0K
ICNkZWZpbmUgYW1kZ3B1X2dtY19nZXRfdm1fcGRlKGFkZXYsIGxldmVsLCBkc3QsIGZsYWdzKSAo
YWRldiktPmdtYy5nbWNfZnVuY3MtPmdldF92bV9wZGUoKGFkZXYpLCAobGV2ZWwpLCAoZHN0KSwg
KGZsYWdzKSkNCisjZGVmaW5lIGFtZGdwdV9nbWNfZ2V0X3ZtX3B0ZShhZGV2LCBtYXBwaW5nLCBm
bGFncykgDQorKGFkZXYpLT5nbWMuZ21jX2Z1bmNzLT5nZXRfdm1fcHRlKChhZGV2KSwgKG1hcHBp
bmcpLCAoZmxhZ3MpKQ0KIA0KIC8qKg0KICAqIGFtZGdwdV9nbWNfdnJhbV9mdWxsX3Zpc2libGUg
LSBDaGVjayBpZiBmdWxsIFZSQU0gaXMgdmlzaWJsZSB0aHJvdWdoIHRoZSBCQVIgZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMNCmluZGV4IDJjYjgyYjIyOTgwMi4uYjI4NWFiMjUx
NDZkIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMN
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jDQpAQCAtMTU3MSwz
MyArMTU3MSw4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZtX2JvX3NwbGl0X21hcHBpbmcoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQogCWlmICghKG1hcHBpbmctPmZsYWdzICYgQU1ER1BVX1BU
RV9XUklURUFCTEUpKQ0KIAkJZmxhZ3MgJj0gfkFNREdQVV9QVEVfV1JJVEVBQkxFOw0KIA0KLQlp
ZiAoYWRldi0+YXNpY190eXBlID49IENISVBfVE9OR0EpIHsNCi0JCWZsYWdzICY9IH5BTURHUFVf
UFRFX0VYRUNVVEFCTEU7DQotCQlmbGFncyB8PSBtYXBwaW5nLT5mbGFncyAmIEFNREdQVV9QVEVf
RVhFQ1VUQUJMRTsNCi0JfQ0KLQ0KLQlpZiAoYWRldi0+YXNpY190eXBlID49IENISVBfTkFWSTEw
KSB7DQotCQlmbGFncyAmPSB+QU1ER1BVX1BURV9NVFlQRV9OVjEwX01BU0s7DQotCQlmbGFncyB8
PSAobWFwcGluZy0+ZmxhZ3MgJiBBTURHUFVfUFRFX01UWVBFX05WMTBfTUFTSyk7DQotCX0gZWxz
ZSB7DQotCQlmbGFncyAmPSB+QU1ER1BVX1BURV9NVFlQRV9WRzEwX01BU0s7DQotCQlmbGFncyB8
PSAobWFwcGluZy0+ZmxhZ3MgJiBBTURHUFVfUFRFX01UWVBFX1ZHMTBfTUFTSyk7DQotCX0NCi0N
Ci0JaWYgKChtYXBwaW5nLT5mbGFncyAmIEFNREdQVV9QVEVfUFJUKSAmJg0KLQkgICAgKGFkZXYt
PmFzaWNfdHlwZSA+PSBDSElQX1ZFR0ExMCkpIHsNCi0JCWZsYWdzIHw9IEFNREdQVV9QVEVfUFJU
Ow0KLQkJaWYgKGFkZXYtPmFzaWNfdHlwZSA+PSBDSElQX05BVkkxMCkgew0KLQkJCWZsYWdzIHw9
IEFNREdQVV9QVEVfU05PT1BFRDsNCi0JCQlmbGFncyB8PSBBTURHUFVfUFRFX0xPRzsNCi0JCQlm
bGFncyB8PSBBTURHUFVfUFRFX1NZU1RFTTsNCi0JCX0NCi0JCWZsYWdzICY9IH5BTURHUFVfUFRF
X1ZBTElEOw0KLQl9DQotCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9BUkNUVVJVUyAmJg0K
LQkgICAgIShmbGFncyAmIEFNREdQVV9QVEVfU1lTVEVNKSAmJg0KLQkgICAgbWFwcGluZy0+Ym9f
dmEtPmlzX3hnbWkpDQotCQlmbGFncyB8PSBBTURHUFVfUFRFX1NOT09QRUQ7DQorCS8qIEFwcGx5
IEFTSUMgc3BlY2lmaWMgbWFwcGluZyBmbGFncyAqLw0KKwlhbWRncHVfZ21jX2dldF92bV9wdGUo
YWRldiwgbWFwcGluZywgJmZsYWdzKTsNCiANCiAJdHJhY2VfYW1kZ3B1X3ZtX2JvX3VwZGF0ZSht
YXBwaW5nKTsNCiANCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNf
djEwXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jDQppbmRleCA3
ZWIwYmE4N2ZlZjkuLjFhOGQ4ZjUyOGIwMSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192MTBfMC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjEwXzAuYw0KQEAgLTQ0MCwxMiArNDQwLDMyIEBAIHN0YXRpYyB2b2lkIGdtY192MTBfMF9n
ZXRfdm1fcGRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBpbnQgbGV2ZWwsDQogCX0NCiB9
DQogDQorc3RhdGljIHZvaWQgZ21jX3YxMF8wX2dldF92bV9wdGUoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsDQorCQkJCSBzdHJ1Y3QgYW1kZ3B1X2JvX3ZhX21hcHBpbmcgKm1hcHBpbmcsDQor
CQkJCSB1aW50NjRfdCAqZmxhZ3MpDQorew0KKwkqZmxhZ3MgJj0gfkFNREdQVV9QVEVfRVhFQ1VU
QUJMRTsNCisJKmZsYWdzIHw9IG1hcHBpbmctPmZsYWdzICYgQU1ER1BVX1BURV9FWEVDVVRBQkxF
Ow0KKw0KKwkqZmxhZ3MgJj0gfkFNREdQVV9QVEVfTVRZUEVfTlYxMF9NQVNLOw0KKwkqZmxhZ3Mg
fD0gKG1hcHBpbmctPmZsYWdzICYgQU1ER1BVX1BURV9NVFlQRV9OVjEwX01BU0spOw0KKw0KKwlp
ZiAobWFwcGluZy0+ZmxhZ3MgJiBBTURHUFVfUFRFX1BSVCkgew0KKwkJKmZsYWdzIHw9IEFNREdQ
VV9QVEVfUFJUOw0KKwkJKmZsYWdzIHw9IEFNREdQVV9QVEVfU05PT1BFRDsNCisJCSpmbGFncyB8
PSBBTURHUFVfUFRFX0xPRzsNCisJCSpmbGFncyB8PSBBTURHUFVfUFRFX1NZU1RFTTsNCisJCSpm
bGFncyAmPSB+QU1ER1BVX1BURV9WQUxJRDsNCisJfQ0KK30NCisNCiBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGFtZGdwdV9nbWNfZnVuY3MgZ21jX3YxMF8wX2dtY19mdW5jcyA9IHsNCiAJLmZsdXNoX2dw
dV90bGIgPSBnbWNfdjEwXzBfZmx1c2hfZ3B1X3RsYiwNCiAJLmVtaXRfZmx1c2hfZ3B1X3RsYiA9
IGdtY192MTBfMF9lbWl0X2ZsdXNoX2dwdV90bGIsDQogCS5lbWl0X3Bhc2lkX21hcHBpbmcgPSBn
bWNfdjEwXzBfZW1pdF9wYXNpZF9tYXBwaW5nLA0KIAkubWFwX210eXBlID0gZ21jX3YxMF8wX21h
cF9tdHlwZSwNCi0JLmdldF92bV9wZGUgPSBnbWNfdjEwXzBfZ2V0X3ZtX3BkZQ0KKwkuZ2V0X3Zt
X3BkZSA9IGdtY192MTBfMF9nZXRfdm1fcGRlLA0KKwkuZ2V0X3ZtX3B0ZSA9IGdtY192MTBfMF9n
ZXRfdm1fcHRlDQogfTsNCiANCiBzdGF0aWMgdm9pZCBnbWNfdjEwXzBfc2V0X2dtY19mdW5jcyhz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikgZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192Nl8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjZf
MC5jDQppbmRleCAyZTMwNWIyMWRiNjkuLjEwZDQ2NzU3YzA3OCAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192Nl8wLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192Nl8wLmMNCkBAIC0zODksNiArMzg5LDE0IEBAIHN0YXRpYyB2b2lkIGdt
Y192Nl8wX2dldF92bV9wZGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGludCBsZXZlbCwN
CiAJQlVHX09OKCphZGRyICYgMHhGRkZGRkYwMDAwMDAwRkZGVUxMKTsgIH0NCiANCitzdGF0aWMg
dm9pZCBnbWNfdjZfMF9nZXRfdm1fcHRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KKwkJ
CQlzdHJ1Y3QgYW1kZ3B1X2JvX3ZhX21hcHBpbmcgKm1hcHBpbmcsDQorCQkJCXVpbnQ2NF90ICpm
bGFncykNCit7DQorCSpmbGFncyAmPSB+QU1ER1BVX1BURV9FWEVDVVRBQkxFOw0KKwkqZmxhZ3Mg
Jj0gfkFNREdQVV9QVEVfUFJUOw0KK30NCisNCiBzdGF0aWMgdm9pZCBnbWNfdjZfMF9zZXRfZmF1
bHRfZW5hYmxlX2RlZmF1bHQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQogCQkJCQkgICAg
ICBib29sIHZhbHVlKQ0KIHsNCkBAIC0xMTQ0LDYgKzExNTIsNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGFtZGdwdV9nbWNfZnVuY3MgZ21jX3Y2XzBfZ21jX2Z1bmNzID0gew0KIAkuZW1pdF9mbHVz
aF9ncHVfdGxiID0gZ21jX3Y2XzBfZW1pdF9mbHVzaF9ncHVfdGxiLA0KIAkuc2V0X3BydCA9IGdt
Y192Nl8wX3NldF9wcnQsDQogCS5nZXRfdm1fcGRlID0gZ21jX3Y2XzBfZ2V0X3ZtX3BkZSwNCisJ
LmdldF92bV9wdGUgPSBnbWNfdjZfMF9nZXRfdm1fcHRlLA0KIH07DQogDQogc3RhdGljIGNvbnN0
IHN0cnVjdCBhbWRncHVfaXJxX3NyY19mdW5jcyBnbWNfdjZfMF9pcnFfZnVuY3MgPSB7IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjdfMC5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y3XzAuYw0KaW5kZXggM2I3NzQyMTIzNGE3Li5mODZjMWYx
NWY3YmYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjdfMC5j
DQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjdfMC5jDQpAQCAtNDY2LDYg
KzQ2NiwxNCBAQCBzdGF0aWMgdm9pZCBnbWNfdjdfMF9nZXRfdm1fcGRlKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LCBpbnQgbGV2ZWwsDQogCUJVR19PTigqYWRkciAmIDB4RkZGRkZGMDAwMDAw
MEZGRlVMTCk7ICB9DQogDQorc3RhdGljIHZvaWQgZ21jX3Y3XzBfZ2V0X3ZtX3B0ZShzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwNCisJCQkJc3RydWN0IGFtZGdwdV9ib192YV9tYXBwaW5nICpt
YXBwaW5nLA0KKwkJCQl1aW50NjRfdCAqZmxhZ3MpDQorew0KKwkqZmxhZ3MgJj0gfkFNREdQVV9Q
VEVfRVhFQ1VUQUJMRTsNCisJKmZsYWdzICY9IH5BTURHUFVfUFRFX1BSVDsNCit9DQorDQogLyoq
DQogICogZ21jX3Y4XzBfc2V0X2ZhdWx0X2VuYWJsZV9kZWZhdWx0IC0gdXBkYXRlIFZNIGZhdWx0
IGhhbmRsaW5nDQogICoNCkBAIC0xMzM5LDcgKzEzNDcsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGFtZGdwdV9nbWNfZnVuY3MgZ21jX3Y3XzBfZ21jX2Z1bmNzID0gew0KIAkuZW1pdF9mbHVzaF9n
cHVfdGxiID0gZ21jX3Y3XzBfZW1pdF9mbHVzaF9ncHVfdGxiLA0KIAkuZW1pdF9wYXNpZF9tYXBw
aW5nID0gZ21jX3Y3XzBfZW1pdF9wYXNpZF9tYXBwaW5nLA0KIAkuc2V0X3BydCA9IGdtY192N18w
X3NldF9wcnQsDQotCS5nZXRfdm1fcGRlID0gZ21jX3Y3XzBfZ2V0X3ZtX3BkZQ0KKwkuZ2V0X3Zt
X3BkZSA9IGdtY192N18wX2dldF92bV9wZGUsDQorCS5nZXRfdm1fcHRlID0gZ21jX3Y3XzBfZ2V0
X3ZtX3B0ZQ0KIH07DQogDQogc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfaXJxX3NyY19mdW5j
cyBnbWNfdjdfMF9pcnFfZnVuY3MgPSB7IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjhfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y4XzAu
Yw0KaW5kZXggNTg0NDRhYTBhZjA1Li4yNTZkMWZhYWNhZGEgMTAwNjQ0DQotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjhfMC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjhfMC5jDQpAQCAtNjg5LDYgKzY4OSwxNiBAQCBzdGF0aWMgdm9pZCBnbWNf
djhfMF9nZXRfdm1fcGRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBpbnQgbGV2ZWwsDQog
CUJVR19PTigqYWRkciAmIDB4RkZGRkZGMDAwMDAwMEZGRlVMTCk7ICB9DQogDQorc3RhdGljIHZv
aWQgZ21jX3Y4XzBfZ2V0X3ZtX3B0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCisJCQkJ
c3RydWN0IGFtZGdwdV9ib192YV9tYXBwaW5nICptYXBwaW5nLA0KKwkJCQl1aW50NjRfdCAqZmxh
Z3MpDQorew0KKwlCVUdfT04oKmZsYWdzICYgQU1ER1BVX1BURV9QUlQpOw0KKw0KKwkqZmxhZ3Mg
Jj0gfkFNREdQVV9QVEVfRVhFQ1VUQUJMRTsNCisJKmZsYWdzIHw9IG1hcHBpbmctPmZsYWdzICYg
QU1ER1BVX1BURV9FWEVDVVRBQkxFOyB9DQorDQogLyoqDQogICogZ21jX3Y4XzBfc2V0X2ZhdWx0
X2VuYWJsZV9kZWZhdWx0IC0gdXBkYXRlIFZNIGZhdWx0IGhhbmRsaW5nDQogICoNCkBAIC0xNzA1
LDcgKzE3MTUsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9nbWNfZnVuY3MgZ21jX3Y4
XzBfZ21jX2Z1bmNzID0gew0KIAkuZW1pdF9mbHVzaF9ncHVfdGxiID0gZ21jX3Y4XzBfZW1pdF9m
bHVzaF9ncHVfdGxiLA0KIAkuZW1pdF9wYXNpZF9tYXBwaW5nID0gZ21jX3Y4XzBfZW1pdF9wYXNp
ZF9tYXBwaW5nLA0KIAkuc2V0X3BydCA9IGdtY192OF8wX3NldF9wcnQsDQotCS5nZXRfdm1fcGRl
ID0gZ21jX3Y4XzBfZ2V0X3ZtX3BkZQ0KKwkuZ2V0X3ZtX3BkZSA9IGdtY192OF8wX2dldF92bV9w
ZGUsDQorCS5nZXRfdm1fcHRlID0gZ21jX3Y4XzBfZ2V0X3ZtX3B0ZQ0KIH07DQogDQogc3RhdGlj
IGNvbnN0IHN0cnVjdCBhbWRncHVfaXJxX3NyY19mdW5jcyBnbWNfdjhfMF9pcnFfZnVuY3MgPSB7
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KaW5kZXggOGVlMGY2NDk4YTg2Li4x
YTE0NGFkM2EyYjEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNf
djlfMC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jDQpAQCAt
NjI3LDEyICs2MjcsMzQgQEAgc3RhdGljIHZvaWQgZ21jX3Y5XzBfZ2V0X3ZtX3BkZShzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwgaW50IGxldmVsLA0KIAl9DQogfQ0KIA0KK3N0YXRpYyB2b2lk
IGdtY192OV8wX2dldF92bV9wdGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQorCQkJCXN0
cnVjdCBhbWRncHVfYm9fdmFfbWFwcGluZyAqbWFwcGluZywNCisJCQkJdWludDY0X3QgKmZsYWdz
KQ0KK3sNCisJKmZsYWdzICY9IH5BTURHUFVfUFRFX0VYRUNVVEFCTEU7DQorCSpmbGFncyB8PSBt
YXBwaW5nLT5mbGFncyAmIEFNREdQVV9QVEVfRVhFQ1VUQUJMRTsNCisNCisJKmZsYWdzICY9IH5B
TURHUFVfUFRFX01UWVBFX1ZHMTBfTUFTSzsNCisJKmZsYWdzIHw9IG1hcHBpbmctPmZsYWdzICYg
QU1ER1BVX1BURV9NVFlQRV9WRzEwX01BU0s7DQorDQorCWlmIChtYXBwaW5nLT5mbGFncyAmIEFN
REdQVV9QVEVfUFJUKSB7DQorCQkqZmxhZ3MgfD0gQU1ER1BVX1BURV9QUlQ7DQorCQkqZmxhZ3Mg
Jj0gfkFNREdQVV9QVEVfVkFMSUQ7DQorCX0NCisNCisJaWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBD
SElQX0FSQ1RVUlVTICYmDQorCSAgICAhKCpmbGFncyAmIEFNREdQVV9QVEVfU1lTVEVNKSAmJg0K
KwkgICAgbWFwcGluZy0+Ym9fdmEtPmlzX3hnbWkpDQorCQkqZmxhZ3MgfD0gQU1ER1BVX1BURV9T
Tk9PUEVEOw0KK30NCisNCiBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9nbWNfZnVuY3MgZ21j
X3Y5XzBfZ21jX2Z1bmNzID0gew0KIAkuZmx1c2hfZ3B1X3RsYiA9IGdtY192OV8wX2ZsdXNoX2dw
dV90bGIsDQogCS5lbWl0X2ZsdXNoX2dwdV90bGIgPSBnbWNfdjlfMF9lbWl0X2ZsdXNoX2dwdV90
bGIsDQogCS5lbWl0X3Bhc2lkX21hcHBpbmcgPSBnbWNfdjlfMF9lbWl0X3Bhc2lkX21hcHBpbmcs
DQogCS5tYXBfbXR5cGUgPSBnbWNfdjlfMF9tYXBfbXR5cGUsDQotCS5nZXRfdm1fcGRlID0gZ21j
X3Y5XzBfZ2V0X3ZtX3BkZQ0KKwkuZ2V0X3ZtX3BkZSA9IGdtY192OV8wX2dldF92bV9wZGUsDQor
CS5nZXRfdm1fcHRlID0gZ21jX3Y5XzBfZ2V0X3ZtX3B0ZQ0KIH07DQogDQogc3RhdGljIHZvaWQg
Z21jX3Y5XzBfc2V0X2dtY19mdW5jcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCi0tDQoy
LjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
CmFtZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
