Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 943E8C24BA
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Sep 2019 17:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D237889C16;
	Mon, 30 Sep 2019 15:57:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810080.outbound.protection.outlook.com [40.107.81.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5795789C16
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Sep 2019 15:57:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwzP1rY/5t4+Lzp8hdlurs2d7u2LytV0GA679Xc0mxo+7MTXeQpQU+IJB3VwA7J9QpZJqlr/fY5TcJv5GCtbDt/TPj6KVZvtJ2ADnMhr5YHF9yJQA/gxXEXuQYs8JkKOCrtnZsHS8YFw9QuPCdH9+Tbn6ojQDZPhfe1yVUs60Pp3I3vIc5aTpf1Zm61aznsfU9yKwSx/wA5FaliX3R7XALeOP8FETYkG4Tvz+xs9WzH1l3SayCfRKPGnpHiH/9/bp5eN7mItfHvwptFNZFxLNxI3GLf+PVmHw7iE/8KxzS/agynr6sNj6pOvrNa7uqR4WY5r/Ei2Kj/v/6z+8xKX+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJ7YPmIExCk3u7VhVFJ2iNEPjiN55+A2WdyBYcCvsGU=;
 b=jicFR/lUBfj53EWrr3Lz3VuM9CZgBD2TwQ7S/NMbIEIWrEZNx/StEdY04cVIoygr59mykYJ8xnVgOk2tC+aMkVhv5WWrmMJz3zxc3H8XtIeXJ7BxUiSrUZ6bSWplIgcPqcRNU5MapQWt49f+Utt7uyDouvTvuybLLq+M9fdlrBGDohriWgtPmlGYM1oUKnDfM24xGK9GEmETpGflyTgc0UMmJ+ZgydX39Au2Y1rNO6G8b3Ps2yi+q57wutXYhYpCX/zP8XaXp/OeiGPs8dEJi9w4PCXOOaWayD4WJdPSf6E4ws7V+LBPvtN0RUUwPEPul3rcpzLXTATku5V0jNqvbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB4124.namprd12.prod.outlook.com (10.141.8.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.18; Mon, 30 Sep 2019 15:57:12 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2284.023; Mon, 30 Sep 2019
 15:57:11 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zhao, Yong" <Yong.Zhao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 5/6] drm/amdgpu: Add the HDP flush support for Navi
Thread-Topic: [PATCH 5/6] drm/amdgpu: Add the HDP flush support for Navi
Thread-Index: AQHVda6sJjCD8zQ3zkqlNbv/3H0SiKdEZBEA
Date: Mon, 30 Sep 2019 15:57:11 +0000
Message-ID: <9e4b4889-4937-bb42-d0f9-79766fd87138@amd.com>
References: <20190928034132.28340-1-Yong.Zhao@amd.com>
 <20190928034132.28340-5-Yong.Zhao@amd.com>
In-Reply-To: <20190928034132.28340-5-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTXPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::30) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c35db4fe-cec7-463e-b965-08d745bedb04
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB4124:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB412438785539A8512D6A20E392820@DM6PR12MB4124.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(52314003)(65806001)(81166006)(8676002)(65956001)(53546011)(3846002)(2906002)(14454004)(25786009)(2501003)(76176011)(36756003)(186003)(99286004)(5660300002)(66066001)(71200400001)(31696002)(14444005)(81156014)(256004)(71190400001)(8936002)(86362001)(6116002)(478600001)(305945005)(7736002)(31686004)(6436002)(476003)(6506007)(26005)(229853002)(66946007)(486006)(102836004)(2616005)(11346002)(446003)(316002)(386003)(6246003)(64756008)(66476007)(66556008)(6512007)(6486002)(58126008)(110136005)(52116002)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4124;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qy8plYUvq5YQwALg0tK12NRolU4jkkugLFpARHUMT+68N7d675hHR3sgdctFFcgu42/vRzDFRgKNMkB3Jz2DhML0uSQx4iEwDnc6koGxjP6fVOEjAmDeliwL9v+RERqvHohVU6lZAhNUXhQHH9ssl25oibAcACeLZSkhG/WqTEJmh9q+8QUfnDNYTEKacp1TI74fu0t8XR4t3loLdVD87JyygTdKpa7c+WVD9WGcTo8j3Cr8SU/nAaYzD16yhc6XZxoFWvR4WApaE3JCrm+J0RPnu0tfd04Kpg1XUwmWCZogFQiB4jlkdCFgqpHRt5wrYmIEYjsvzilV3nlvfLhGMgw5Fw263c7B+hvNp16gc+Vur3Hs10uDcflWl3H4xpM40CtGtwugAMfZl1rcllpZN04WroNrd7GBd/MJUSfgD/k=
Content-ID: <E5D29B6694889A4CACC79406415A901B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c35db4fe-cec7-463e-b965-08d745bedb04
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 15:57:11.8006 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nPR22r5ET0yGpY4aWw2oUvCnuMRkSErNAwenrtUTVY1flesdiyhp86bo3OPkUGIN4ZtypdCnLXSpYGV+2Pm2Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4124
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJ7YPmIExCk3u7VhVFJ2iNEPjiN55+A2WdyBYcCvsGU=;
 b=QqeQd2J024sKlnKnYMBq6Ga+8ZJRR9JZjRgyNMlPhDRT/DMIbJW4OHKL8h7okmInOFfZR5MP02mMjz98glc+pxSDLLntjrMeJWnsy/TE6XiNB//NAop7mmS9d6H0Jx2SOLXlmnwVQ81ELEg273ALSET+BHzpZSk2sBwm2LRP5AQ=
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

QXMgZmFyIGFzIEkgY2FuIHRlbGwsIHRoaXMgaXMgdGhlIG9ubHkgcGF0Y2ggd2l0aCBmdW5jdGlv
bmFsIGNoYW5nZXMgaW4gDQp0aGUgcGF0Y2ggc2VyaWVzLiBUaGUgcmVzdCBhcmUgcHVyZWx5IGNs
ZWFuLXVwLiBBbnkgcmVsYXRpb24gSSdtIG1pc3Npbmc/DQoNCkFueXdheSwgcGF0Y2hlcyAyLDMs
NSBhcmUNCg0KUmV2aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQu
Y29tPg0KDQpPbiAyMDE5LTA5LTI3IDExOjQxIHAubS4sIFpoYW8sIFlvbmcgd3JvdGU6DQo+IFRo
ZSBIRFAgZmx1c2ggc3VwcG9ydCBjb2RlIHdhcyBtaXNzaW5nIGluIHRoZSBuYmlvIGFuZCBudiBm
aWxlcy4NCj4NCj4gQ2hhbmdlLUlkOiBJMDQ2ZmY1MjU2NzY3NmI1NmJmMTZkYzE3MjhiMDI0ODEy
MzNhY2I2MQ0KPiBTaWduZWQtb2ZmLWJ5OiBZb25nIFpoYW8gPFlvbmcuWmhhb0BhbWQuY29tPg0K
PiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlvX3YyXzMuYyB8IDE2ICsr
KysrKysrKysrKystLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jICAgICAg
ICB8ICA5ICsrKysrKysrKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L25iaW9fdjJfMy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmJpb192Ml8zLmMN
Cj4gaW5kZXggZTdlMzZmYjYxMTNkLi5jNjk5Y2JmZTAxNWEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9fdjJfMy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L25iaW9fdjJfMy5jDQo+IEBAIC0yNywxMSArMjcsMjEgQEANCj4gICAjaW5j
bHVkZSAibmJpby9uYmlvXzJfM19kZWZhdWx0LmgiDQo+ICAgI2luY2x1ZGUgIm5iaW8vbmJpb18y
XzNfb2Zmc2V0LmgiDQo+ICAgI2luY2x1ZGUgIm5iaW8vbmJpb18yXzNfc2hfbWFzay5oIg0KPiAr
I2luY2x1ZGUgPHVhcGkvbGludXgva2ZkX2lvY3RsLmg+DQo+ICAgDQo+ICAgI2RlZmluZSBzbW5Q
Q0lFX0NPTkZJR19DTlRMCTB4MTExODAwNDQNCj4gICAjZGVmaW5lIHNtbkNQTV9DT05UUk9MCQkw
eDExMTgwNDYwDQo+ICAgI2RlZmluZSBzbW5QQ0lFX0NOVEwyCQkweDExMTgwMDcwDQo+ICAgDQo+
ICsNCj4gK3N0YXRpYyB2b2lkIG5iaW9fdjJfM19yZW1hcF9oZHBfcmVnaXN0ZXJzKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQ0KPiArew0KPiArCVdSRUczMl9TT0MxNShOQklPLCAwLCBtbVJF
TUFQX0hEUF9NRU1fRkxVU0hfQ05UTCwNCj4gKwkJYWRldi0+cm1taW9fcmVtYXAucmVnX29mZnNl
dCArIEtGRF9NTUlPX1JFTUFQX0hEUF9NRU1fRkxVU0hfQ05UTCk7DQo+ICsJV1JFRzMyX1NPQzE1
KE5CSU8sIDAsIG1tUkVNQVBfSERQX1JFR19GTFVTSF9DTlRMLA0KPiArCQlhZGV2LT5ybW1pb19y
ZW1hcC5yZWdfb2Zmc2V0ICsgS0ZEX01NSU9fUkVNQVBfSERQX1JFR19GTFVTSF9DTlRMKTsNCj4g
K30NCj4gKw0KPiAgIHN0YXRpYyB1MzIgbmJpb192Ml8zX2dldF9yZXZfaWQoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpDQo+ICAgew0KPiAgIAl1MzIgdG1wID0gUlJFRzMyX1NPQzE1KE5CSU8s
IDAsIG1tUkNDX0RFVjBfRVBGMF9TVFJBUDApOw0KPiBAQCAtNTYsMTAgKzY2LDkgQEAgc3RhdGlj
IHZvaWQgbmJpb192Ml8zX2hkcF9mbHVzaChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4g
ICAJCQkJc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQ0KPiAgIHsNCj4gICAJaWYgKCFyaW5nIHx8
ICFyaW5nLT5mdW5jcy0+ZW1pdF93cmVnKQ0KPiAtCQlXUkVHMzJfU09DMTVfTk9fS0lRKE5CSU8s
IDAsIG1tQklGX0JYX1BGX0hEUF9NRU1fQ09IRVJFTkNZX0ZMVVNIX0NOVEwsIDApOw0KPiArCQlX
UkVHMzJfTk9fS0lRKChhZGV2LT5ybW1pb19yZW1hcC5yZWdfb2Zmc2V0ICsgS0ZEX01NSU9fUkVN
QVBfSERQX01FTV9GTFVTSF9DTlRMKSA+PiAyLCAwKTsNCj4gICAJZWxzZQ0KPiAtCQlhbWRncHVf
cmluZ19lbWl0X3dyZWcocmluZywgU09DMTVfUkVHX09GRlNFVCgNCj4gLQkJCU5CSU8sIDAsIG1t
QklGX0JYX1BGX0hEUF9NRU1fQ09IRVJFTkNZX0ZMVVNIX0NOVEwpLCAwKTsNCj4gKwkJYW1kZ3B1
X3JpbmdfZW1pdF93cmVnKHJpbmcsIChhZGV2LT5ybW1pb19yZW1hcC5yZWdfb2Zmc2V0ICsgS0ZE
X01NSU9fUkVNQVBfSERQX01FTV9GTFVTSF9DTlRMKSA+PiAyLCAwKTsNCj4gICB9DQo+ICAgDQo+
ICAgc3RhdGljIHUzMiBuYmlvX3YyXzNfZ2V0X21lbXNpemUoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpDQo+IEBAIC0zMzAsNCArMzM5LDUgQEAgY29uc3Qgc3RydWN0IGFtZGdwdV9uYmlvX2Z1
bmNzIG5iaW9fdjJfM19mdW5jcyA9IHsNCj4gICAJLmloX2NvbnRyb2wgPSBuYmlvX3YyXzNfaWhf
Y29udHJvbCwNCj4gICAJLmluaXRfcmVnaXN0ZXJzID0gbmJpb192Ml8zX2luaXRfcmVnaXN0ZXJz
LA0KPiAgIAkuZGV0ZWN0X2h3X3ZpcnQgPSBuYmlvX3YyXzNfZGV0ZWN0X2h3X3ZpcnQsDQo+ICsJ
LnJlbWFwX2hkcF9yZWdpc3RlcnMgPSBuYmlvX3Y3XzRfcmVtYXBfaGRwX3JlZ2lzdGVycywNCj4g
ICB9Ow0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMNCj4gaW5kZXggYjNlNzc1NmZjYzRiLi42Njk5
YTQ1Yjg4ZWMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYw0KPiBAQCAtNTg3LDggKzU4
NywxMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9hc2ljX2Z1bmNzIG52X2FzaWNfZnVu
Y3MgPQ0KPiAgIA0KPiAgIHN0YXRpYyBpbnQgbnZfY29tbW9uX2Vhcmx5X2luaXQodm9pZCAqaGFu
ZGxlKQ0KPiAgIHsNCj4gKyNkZWZpbmUgTU1JT19SRUdfSE9MRV9PRkZTRVQgKDB4ODAwMDAgLSBQ
QUdFX1NJWkUpDQo+ICAgCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICopaGFuZGxlOw0KPiAgIA0KPiArCWFkZXYtPnJtbWlvX3JlbWFwLnJlZ19vZmZz
ZXQgPSBNTUlPX1JFR19IT0xFX09GRlNFVDsNCj4gKwlhZGV2LT5ybW1pb19yZW1hcC5idXNfYWRk
ciA9IGFkZXYtPnJtbWlvX2Jhc2UgKyBNTUlPX1JFR19IT0xFX09GRlNFVDsNCj4gICAJYWRldi0+
c21jX3JyZWcgPSBOVUxMOw0KPiAgIAlhZGV2LT5zbWNfd3JlZyA9IE5VTEw7DQo+ICAgCWFkZXYt
PnBjaWVfcnJlZyA9ICZudl9wY2llX3JyZWc7DQo+IEBAIC03MTQsNiArNzE3LDEyIEBAIHN0YXRp
YyBpbnQgbnZfY29tbW9uX2h3X2luaXQodm9pZCAqaGFuZGxlKQ0KPiAgIAludl9wcm9ncmFtX2Fz
cG0oYWRldik7DQo+ICAgCS8qIHNldHVwIG5iaW8gcmVnaXN0ZXJzICovDQo+ICAgCWFkZXYtPm5i
aW8uZnVuY3MtPmluaXRfcmVnaXN0ZXJzKGFkZXYpOw0KPiArCS8qIHJlbWFwIEhEUCByZWdpc3Rl
cnMgdG8gYSBob2xlIGluIG1taW8gc3BhY2UsDQo+ICsJICogZm9yIHRoZSBwdXJwb3NlIG9mIGV4
cG9zZSB0aG9zZSByZWdpc3RlcnMNCj4gKwkgKiB0byBwcm9jZXNzIHNwYWNlDQo+ICsJICovDQo+
ICsJaWYgKGFkZXYtPm5iaW8uZnVuY3MtPnJlbWFwX2hkcF9yZWdpc3RlcnMpDQo+ICsJCWFkZXYt
Pm5iaW8uZnVuY3MtPnJlbWFwX2hkcF9yZWdpc3RlcnMoYWRldik7DQo+ICAgCS8qIGVuYWJsZSB0
aGUgZG9vcmJlbGwgYXBlcnR1cmUgKi8NCj4gICAJbnZfZW5hYmxlX2Rvb3JiZWxsX2FwZXJ0dXJl
KGFkZXYsIHRydWUpOw0KPiAgIA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
