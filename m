Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E55E5A58
	for <lists+amd-gfx@lfdr.de>; Sat, 26 Oct 2019 14:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C336E03B;
	Sat, 26 Oct 2019 12:05:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820050.outbound.protection.outlook.com [40.107.82.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9336E03B
 for <amd-gfx@lists.freedesktop.org>; Sat, 26 Oct 2019 12:05:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbszWsJ0b227Ybq9SlDKjDQjAc25URj7hMYbACp9lF+vefumXqhe914QBOODQjyBMUbUq6kHjIaGEsJYRrjdPO2cC0ZLV3IwGSx6JdFk1exkmUm2QB7xdWc+Yw9Ih8OjMHiWLfhcYAP+jyt2u6eGUOe0S4ejK4CFUVvYd7Z/aX3W9JgCvzrSr2ASB0Ups02M1Ei4iYgnfUl797Yl3fheomgJpjBCd+Cm+Hm2YfRu85Vk6QUBAsgEsUpDT9EQLxUGAV9cEdTC45kUR9afu0i7cJ994hHPss4S+m+5LFEbDLAbP0/3pk2NBtYRnqH5ijJC3WGXNFHG0qBsTEgn3+x4dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+n4wUj5oN0uA0Y1smljzquVsXV6F7U0alj4YUt6tb4=;
 b=U+4YeqdjtGNYDI+RUMaMYVJcekrKF0Q+6MiXPZi6GuC+f8pF2H+c53HHjNUS3/DqFvTGejS5CADDFbSMNXr955rAdkYS2AlXo7Nwx1adulCUmBMLK3QiK13vMC0WMxjJK1WqSTRjqu/J8zm6fedxl9f1EVh7meQ+rem48msOmFyvAl46eobtiSOUYk2VH9Z/7nvv9HAAnZEZyV3qVgAIQrPULnUW5SMU+RbN/yJXecwyToGxPGhx9x2yfMUT++9F/lCIHy+aMX801a5XzmsIgD+/HTbR/J01dUNLO3OmMWCbqV5Iu1fb+xqFLa0RWTMAJYA6RJ6kRgTC3ppjRFD6AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1305.namprd12.prod.outlook.com (10.168.237.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.23; Sat, 26 Oct 2019 12:05:43 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933%7]) with mapi id 15.20.2387.025; Sat, 26 Oct 2019
 12:05:43 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Tuikov, Luben" <Luben.Tuikov@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: simplify padding calculations
Thread-Topic: [PATCH] drm/amdgpu: simplify padding calculations
Thread-Index: AQHVisULvYz/N9VAyU2dNn0xqbhFTqdq7J0AgAD6hwCAAO6tAA==
Date: Sat, 26 Oct 2019 12:05:43 +0000
Message-ID: <db4d6ece-2cec-a465-0639-d75142621dda@amd.com>
References: <20191024234444.4375-1-luben.tuikov@amd.com>
 <45e07677-717a-2c01-369e-1dbd19ce8e74@amd.com>
 <ed713bfe-2032-b56a-3e29-f61f48aeeb3b@amd.com>
In-Reply-To: <ed713bfe-2032-b56a-3e29-f61f48aeeb3b@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR06CA0092.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::33) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c4c84cd8-3d6b-458a-341f-08d75a0cd335
x-ms-traffictypediagnostic: DM5PR12MB1305:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB13052701BDE838A63AF4BC4683640@DM5PR12MB1305.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0202D21D2F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(39860400002)(366004)(376002)(199004)(189003)(86362001)(6246003)(256004)(65956001)(305945005)(66476007)(66556008)(64756008)(65806001)(11346002)(66446008)(486006)(6436002)(4001150100001)(2616005)(4326008)(58126008)(446003)(81166006)(81156014)(31696002)(8676002)(66946007)(7736002)(5660300002)(478600001)(229853002)(316002)(6486002)(36756003)(31686004)(386003)(53546011)(76176011)(186003)(6506007)(6512007)(8936002)(14454004)(25786009)(110136005)(476003)(71190400001)(71200400001)(102836004)(99286004)(2501003)(52116002)(46003)(6116002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1305;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oL39CE+F/UU55HFSbvKXmsbSEQ74IB12Jd8wV9IFzX3yWaDDGOZvVTDFheJDj+39lsLmSHM8Q+lhEMMWa+YysJZ7nXcbSDvYnzJIhBMP+pDHFHsIAGx6B2xJjV980sQE6ORgkZ8aBEP4iKIWaWzVNlSClIHGCuQrq1rCcLW0fpuf5zxTF0SrhY/eXyhOb87p05j5DbPAaj9Ui0SbOffAU6q0vYKIeY9Dncs85qCx3KP1PO+eVM2hq58ttmCdidl1jXGOZabQAMXaw/olm5ggVMcBfcuZ96TxTvVMYNKBJrCgsQud8Yj8imWLDJtasH0xUZbRcI0GM5bE+KpTN97bcT/BZnXmMbEX0ynSavWD8sSXl4/Wce5EN9FGWbvVdCiCpXCG6OF1iEmK+QprhHYfK4foun40e9xsgPQoKjS21fYJrBd4f4u+fJJc7ogVQ4OG
Content-ID: <EF3F0AD0A9D1E74498FF9DE8DCC38330@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c84cd8-3d6b-458a-341f-08d75a0cd335
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2019 12:05:43.2258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZSdAJ0wJ/sAhErLHl+aEWPkWxaHcGSTIsFWMEsmxXQP4gfzWRZDv0H04yq9lCuUJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1305
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+n4wUj5oN0uA0Y1smljzquVsXV6F7U0alj4YUt6tb4=;
 b=lWSPHMzBUgDHf8VfB0S3Vi4vPvMtU1kV5VeR1bJla2nDg5BYEGbN7x4XLHB01W3hb5oO4c3aZKDEak0qskTZHeqr6EEI9kUSVcSy1uf0T1SjjRcdmWVcCmsTcuufOedxv+WOO1wt9yg38kHnNUNe75RX2WLIOAmBCN2ZabU1/IA=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjUuMTAuMTkgdW0gMjM6NTEgc2NocmllYiBUdWlrb3YsIEx1YmVuOg0KPiBPbiAyMDE5LTEw
LTI1IDI6NTQgYS5tLiwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6DQo+PiBBbSAyNS4xMC4xOSB1
bSAwMTo0NCBzY2hyaWViIFR1aWtvdiwgTHViZW46DQo+Pj4gU2ltcGxpZnkgcGFkZGluZyBjYWxj
dWxhdGlvbnMuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBMdWJlbiBUdWlrb3YgPGx1YmVuLnR1
aWtvdkBhbWQuY29tPg0KPj4+IC0tLQ0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2Npa19zZG1hLmMgIHwgIDQgKystLQ0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3NkbWFfdjJfNC5jIHwgIDQgKystLQ0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3NkbWFfdjNfMC5jIHwgIDQgKystLQ0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3NkbWFfdjRfMC5jIHwgIDQgKystLQ0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3NkbWFfdjVfMC5jIHwgMTQgKysrKysrKysrLS0tLS0NCj4+PiAgICA1IGZpbGVzIGNoYW5nZWQs
IDE3IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Npa19zZG1hLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9jaWtfc2RtYS5jDQo+Pj4gaW5kZXggYzQ1MzA0ZjEwNDdjLi4xZWE5ZTE4ZDZm
MDggMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvY2lrX3NkbWEu
Yw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Npa19zZG1hLmMNCj4+PiBA
QCAtMjI4LDcgKzIyOCw3IEBAIHN0YXRpYyB2b2lkIGNpa19zZG1hX3JpbmdfZW1pdF9pYihzdHJ1
Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsDQo+Pj4gICAgCXUzMiBleHRyYV9iaXRzID0gdm1pZCAmIDB4
ZjsNCj4+PiAgICANCj4+PiAgICAJLyogSUIgcGFja2V0IG11c3QgZW5kIG9uIGEgOCBEVyBib3Vu
ZGFyeSAqLw0KPj4+IC0JY2lrX3NkbWFfcmluZ19pbnNlcnRfbm9wKHJpbmcsICgxMiAtIChsb3dl
cl8zMl9iaXRzKHJpbmctPndwdHIpICYgNykpICUgOCk7DQo+Pj4gKwljaWtfc2RtYV9yaW5nX2lu
c2VydF9ub3AocmluZywgKDQtbG93ZXJfMzJfYml0cyhyaW5nLT53cHRyKSkgJiA3KTsNCj4+PiAg
ICANCj4+PiAgICAJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgU0RNQV9QQUNLRVQoU0RNQV9PUENP
REVfSU5ESVJFQ1RfQlVGRkVSLCAwLCBleHRyYV9iaXRzKSk7DQo+Pj4gICAgCWFtZGdwdV9yaW5n
X3dyaXRlKHJpbmcsIGliLT5ncHVfYWRkciAmIDB4ZmZmZmZmZTApOyAvKiBiYXNlIG11c3QgYmUg
MzIgYnl0ZSBhbGlnbmVkICovDQo+Pj4gQEAgLTgxMSw3ICs4MTEsNyBAQCBzdGF0aWMgdm9pZCBj
aWtfc2RtYV9yaW5nX3BhZF9pYihzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHN0cnVjdCBhbWRn
cHVfaWIgKmliKQ0KPj4+ICAgIAl1MzIgcGFkX2NvdW50Ow0KPj4+ICAgIAlpbnQgaTsNCj4+PiAg
ICANCj4+PiAtCXBhZF9jb3VudCA9ICg4IC0gKGliLT5sZW5ndGhfZHcgJiAweDcpKSAlIDg7DQo+
Pj4gKwlwYWRfY291bnQgPSAoLWliLT5sZW5ndGhfZHcpICYgNzsNCj4+PiAgICAJZm9yIChpID0g
MDsgaSA8IHBhZF9jb3VudDsgaSsrKQ0KPj4+ICAgIAkJaWYgKHNkbWEgJiYgc2RtYS0+YnVyc3Rf
bm9wICYmIChpID09IDApKQ0KPj4+ICAgIAkJCWliLT5wdHJbaWItPmxlbmd0aF9kdysrXSA9DQo+
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjJfNC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92Ml80LmMNCj4+PiBpbmRleCBhMTAxNzU4
MzgwMTMuLmQzNDBmMTc5NDAxYSAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9zZG1hX3YyXzQuYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3NkbWFfdjJfNC5jDQo+Pj4gQEAgLTI1NSw3ICsyNTUsNyBAQCBzdGF0aWMgdm9pZCBzZG1hX3Yy
XzRfcmluZ19lbWl0X2liKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywNCj4+PiAgICAJdW5zaWdu
ZWQgdm1pZCA9IEFNREdQVV9KT0JfR0VUX1ZNSUQoam9iKTsNCj4+PiAgICANCj4+PiAgICAJLyog
SUIgcGFja2V0IG11c3QgZW5kIG9uIGEgOCBEVyBib3VuZGFyeSAqLw0KPj4+IC0Jc2RtYV92Ml80
X3JpbmdfaW5zZXJ0X25vcChyaW5nLCAoMTAgLSAobG93ZXJfMzJfYml0cyhyaW5nLT53cHRyKSAm
IDcpKSAlIDgpOw0KPj4+ICsJc2RtYV92Ml80X3JpbmdfaW5zZXJ0X25vcChyaW5nLCAoMi1sb3dl
cl8zMl9iaXRzKHJpbmctPndwdHIpKSAmIDcpOw0KPj4+ICAgIA0KPj4+ICAgIAlhbWRncHVfcmlu
Z193cml0ZShyaW5nLCBTRE1BX1BLVF9IRUFERVJfT1AoU0RNQV9PUF9JTkRJUkVDVCkgfA0KPj4+
ICAgIAkJCSAgU0RNQV9QS1RfSU5ESVJFQ1RfSEVBREVSX1ZNSUQodm1pZCAmIDB4ZikpOw0KPj4+
IEBAIC03NTAsNyArNzUwLDcgQEAgc3RhdGljIHZvaWQgc2RtYV92Ml80X3JpbmdfcGFkX2liKHN0
cnVjdCBhbWRncHVfcmluZyAqcmluZywgc3RydWN0IGFtZGdwdV9pYiAqaWINCj4+PiAgICAJdTMy
IHBhZF9jb3VudDsNCj4+PiAgICAJaW50IGk7DQo+Pj4gICAgDQo+Pj4gLQlwYWRfY291bnQgPSAo
OCAtIChpYi0+bGVuZ3RoX2R3ICYgMHg3KSkgJSA4Ow0KPj4+ICsJcGFkX2NvdW50ID0gKC1pYi0+
bGVuZ3RoX2R3KSAmIDc7DQo+Pj4gICAgCWZvciAoaSA9IDA7IGkgPCBwYWRfY291bnQ7IGkrKykN
Cj4+PiAgICAJCWlmIChzZG1hICYmIHNkbWEtPmJ1cnN0X25vcCAmJiAoaSA9PSAwKSkNCj4+PiAg
ICAJCQlpYi0+cHRyW2liLT5sZW5ndGhfZHcrK10gPQ0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3YzXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3NkbWFfdjNfMC5jDQo+Pj4gaW5kZXggNWY0ZTJjNjE2MjQxLi41YzNjMzEwMTg4YjYgMTAw
NjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92M18wLmMNCj4+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3YzXzAuYw0KPj4+IEBAIC00
MjksNyArNDI5LDcgQEAgc3RhdGljIHZvaWQgc2RtYV92M18wX3JpbmdfZW1pdF9pYihzdHJ1Y3Qg
YW1kZ3B1X3JpbmcgKnJpbmcsDQo+Pj4gICAgCXVuc2lnbmVkIHZtaWQgPSBBTURHUFVfSk9CX0dF
VF9WTUlEKGpvYik7DQo+Pj4gICAgDQo+Pj4gICAgCS8qIElCIHBhY2tldCBtdXN0IGVuZCBvbiBh
IDggRFcgYm91bmRhcnkgKi8NCj4+PiAtCXNkbWFfdjNfMF9yaW5nX2luc2VydF9ub3AocmluZywg
KDEwIC0gKGxvd2VyXzMyX2JpdHMocmluZy0+d3B0cikgJiA3KSkgJSA4KTsNCj4+PiArCXNkbWFf
djNfMF9yaW5nX2luc2VydF9ub3AocmluZywgKDItbG93ZXJfMzJfYml0cyhyaW5nLT53cHRyKSkg
JiA3KTsNCj4+PiAgICANCj4+PiAgICAJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgU0RNQV9QS1Rf
SEVBREVSX09QKFNETUFfT1BfSU5ESVJFQ1QpIHwNCj4+PiAgICAJCQkgIFNETUFfUEtUX0lORElS
RUNUX0hFQURFUl9WTUlEKHZtaWQgJiAweGYpKTsNCj4+PiBAQCAtMTAyMSw3ICsxMDIxLDcgQEAg
c3RhdGljIHZvaWQgc2RtYV92M18wX3JpbmdfcGFkX2liKHN0cnVjdCBhbWRncHVfcmluZyAqcmlu
Zywgc3RydWN0IGFtZGdwdV9pYiAqaWINCj4+PiAgICAJdTMyIHBhZF9jb3VudDsNCj4+PiAgICAJ
aW50IGk7DQo+Pj4gICAgDQo+Pj4gLQlwYWRfY291bnQgPSAoOCAtIChpYi0+bGVuZ3RoX2R3ICYg
MHg3KSkgJSA4Ow0KPj4+ICsJcGFkX2NvdW50ID0gKC1pYi0+bGVuZ3RoX2R3KSAmIDc7DQo+Pj4g
ICAgCWZvciAoaSA9IDA7IGkgPCBwYWRfY291bnQ7IGkrKykNCj4+PiAgICAJCWlmIChzZG1hICYm
IHNkbWEtPmJ1cnN0X25vcCAmJiAoaSA9PSAwKSkNCj4+PiAgICAJCQlpYi0+cHRyW2liLT5sZW5n
dGhfZHcrK10gPQ0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9z
ZG1hX3Y0XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jDQo+Pj4g
aW5kZXggNDViZDUzOGJhOTdlLi43YzcxYzg4ZTM4YTQgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYw0KPj4+IEBAIC02OTgsNyArNjk4LDcgQEAgc3RhdGlj
IHZvaWQgc2RtYV92NF8wX3JpbmdfZW1pdF9pYihzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsDQo+
Pj4gICAgCXVuc2lnbmVkIHZtaWQgPSBBTURHUFVfSk9CX0dFVF9WTUlEKGpvYik7DQo+Pj4gICAg
DQo+Pj4gICAgCS8qIElCIHBhY2tldCBtdXN0IGVuZCBvbiBhIDggRFcgYm91bmRhcnkgKi8NCj4+
PiAtCXNkbWFfdjRfMF9yaW5nX2luc2VydF9ub3AocmluZywgKDEwIC0gKGxvd2VyXzMyX2JpdHMo
cmluZy0+d3B0cikgJiA3KSkgJSA4KTsNCj4+PiArCXNkbWFfdjRfMF9yaW5nX2luc2VydF9ub3Ao
cmluZywgKDItbG93ZXJfMzJfYml0cyhyaW5nLT53cHRyKSkgJiA3KTsNCj4+PiAgICANCj4+PiAg
ICAJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgU0RNQV9QS1RfSEVBREVSX09QKFNETUFfT1BfSU5E
SVJFQ1QpIHwNCj4+PiAgICAJCQkgIFNETUFfUEtUX0lORElSRUNUX0hFQURFUl9WTUlEKHZtaWQg
JiAweGYpKTsNCj4+PiBAQCAtMTU4MCw3ICsxNTgwLDcgQEAgc3RhdGljIHZvaWQgc2RtYV92NF8w
X3JpbmdfcGFkX2liKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgc3RydWN0IGFtZGdwdV9pYiAq
aWINCj4+PiAgICAJdTMyIHBhZF9jb3VudDsNCj4+PiAgICAJaW50IGk7DQo+Pj4gICAgDQo+Pj4g
LQlwYWRfY291bnQgPSAoOCAtIChpYi0+bGVuZ3RoX2R3ICYgMHg3KSkgJSA4Ow0KPj4+ICsJcGFk
X2NvdW50ID0gKC1pYi0+bGVuZ3RoX2R3KSAmIDc7DQo+Pj4gICAgCWZvciAoaSA9IDA7IGkgPCBw
YWRfY291bnQ7IGkrKykNCj4+PiAgICAJCWlmIChzZG1hICYmIHNkbWEtPmJ1cnN0X25vcCAmJiAo
aSA9PSAwKSkNCj4+PiAgICAJCQlpYi0+cHRyW2liLT5sZW5ndGhfZHcrK10gPQ0KPj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjVfMC5jDQo+Pj4gaW5kZXggMGM0MWI0ZmRjNThiLi42
N2VkZTllNGRmMDEgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
c2RtYV92NV8wLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1
XzAuYw0KPj4+IEBAIC0zODIsOCArMzgyLDEyIEBAIHN0YXRpYyB2b2lkIHNkbWFfdjVfMF9yaW5n
X2VtaXRfaWIoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLA0KPj4+ICAgIAl1bnNpZ25lZCB2bWlk
ID0gQU1ER1BVX0pPQl9HRVRfVk1JRChqb2IpOw0KPj4+ICAgIAl1aW50NjRfdCBjc2FfbWNfYWRk
ciA9IGFtZGdwdV9zZG1hX2dldF9jc2FfbWNfYWRkcihyaW5nLCB2bWlkKTsNCj4+PiAgICANCj4+
PiAtCS8qIElCIHBhY2tldCBtdXN0IGVuZCBvbiBhIDggRFcgYm91bmRhcnkgKi8NCj4+PiAtCXNk
bWFfdjVfMF9yaW5nX2luc2VydF9ub3AocmluZywgKDEwIC0gKGxvd2VyXzMyX2JpdHMocmluZy0+
d3B0cikgJiA3KSkgJSA4KTsNCj4+PiArCS8qIEFuIElCIHBhY2tldCBtdXN0IGVuZCBvbiBhIDgg
RFcgYm91bmRhcnktLXRoZSBuZXh0IGR3b3JkIG11c3QNCj4+PiArCSAqIGJlIG9uIGEgOC1kd29y
ZCBib3VuZGFyeS4gT3VyIElCIGJlbG93IGlzIDYgZHdvcmRzIGxvbmcsDQo+PiBUaGF0IHNob3Vs
ZCBwcm9iYWJseSByZWFkICJvdXIgSUIgY29tbWFuZCIgb3IgIm91ciBJQiBwYWNrZXQiLg0KPiBE
b25lLg0KPg0KPj4+ICsJICogdGh1cyBhZGQgeCBudW1iZXIgb2YgTk9Qcywgc3VjaCB0aGF0DQo+
Pj4gKwkgKiB3cHRyICsgNiArIHggPSA4aywgayA+PSAwLg0KPj4gTWF5YmUgd3JpdGUgKHdycHRy
ICsgNiArIHgpICUgOCA9IDAgdG8gbWFrZSB0aGF0IG1vcmUgb2J2aW91cy4NCj4gVGhhdCdzIGxl
c3Mgb2J2aW91cy4gSW4gbXkgbWluZCBJIGFsd2F5cyB0cmFuc2xhdGUgaXQgdG8NCj4gYSBjb25n
cnVlbmNlIGV4cHJlc3Npb24uIEl0J3Mgd2hhdCBJIHVzZWQgdG8gZGVyaXZlIHRoZSBhbGdlYnJh
aWMNCj4gc2ltcGxpZmljYXRpb25zIG9mIHRoaXMgcGF0Y2guDQo+DQo+IEknbGwgYWRkIHRoZSBo
aWdobHkgY3J5cHRpYyAiKHdycHRyICsgNiArIHgpICUgOCA9IDAiIHRvIG1ha2UgeW91IGhhcHB5
LA0KPiBiZWxvdyB0aGUgYWxnZWJyYWljIGV4cHJlc3Npb24gYWxyZWFkeSB0aGVyZS4NCg0KVGhl
IHByb2JsZW0gSSBzZWUgaGVyZSBpcyB0aGF0IHBlb3BsZSB3aG8gYXJlIHVzZWQgdG8gR1BVcyB3
aWxsIHRoaW5rIA0KdGhhdCBrIGlzIGEgZmxvYXQgYW5kIG5vdCBpbW1lZGlhdGVseSBnZXQgd2hh
dCdzIG1lYW50IGhlcmUuDQoNCj4+PiArCSAqLw0KPj4+ICsJc2RtYV92NV8wX3JpbmdfaW5zZXJ0
X25vcChyaW5nLCAoMi1sb3dlcl8zMl9iaXRzKHJpbmctPndwdHIpKSAmIDcpOw0KPj4gU3BhY2Vz
IGJldHdlZW4gb3BlcmF0b3JzIHBsZWFzZS4NCj4gWWVhaCwgSSB3YW50ZWQgdG8gcHV0IGFuIGVt
cGhhc2lzIG9uIHRoZSBBTkQtb3AsIGJ1dCBJJ2xsIGFkZCB0aGVtLg0KDQpXaGF0IHdvdWxkIGJl
IHJlYWxseSBuaWNlIHRvIGhhdmUgaXMgdG8ga2VlcCB0aGUgMTAgYXMgbnVtYmVyIG9mIERXIGlu
IA0KdGhlIElCIHBhY2tldCBhcm91bmQuDQoNCk1heWJlIGFkZCBhbiAic3RhdGljIGlubGluZSBh
bWRncHVfcmluZ191bmFsaWduKHJpbmcsIDEwLCA4KSIgaGVscGVyIG9yIA0Kc29tZXRoaW5nIGxp
a2UgdGhhdCwgdGhlIGluc2VydF9ub3AgaXMgYSByaW5nIGNhbGxiYWNrIGFueXdheSBJSVJDLg0K
DQpSZWdhcmRzLA0KQ2hyaXN0aWFuLg0KDQo+DQo+IFJlZ2FyZHMsDQo+IEx1YmVuDQo+DQo+DQo+
PiBBcGFydCBmb3JtIHRoYXQgbG9va3MgZ29vZCB0byBtZSwNCj4+IENocmlzdGlhbi4NCj4+DQo+
Pj4gICAgDQo+Pj4gICAgCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFNETUFfUEtUX0hFQURFUl9P
UChTRE1BX09QX0lORElSRUNUKSB8DQo+Pj4gICAgCQkJICBTRE1BX1BLVF9JTkRJUkVDVF9IRUFE
RVJfVk1JRCh2bWlkICYgMHhmKSk7DQo+Pj4gQEAgLTEwODYsMTAgKzEwOTAsMTAgQEAgc3RhdGlj
IHZvaWQgc2RtYV92NV8wX3ZtX3NldF9wdGVfcGRlKHN0cnVjdCBhbWRncHVfaWIgKmliLA0KPj4+
ICAgIH0NCj4+PiAgICANCj4+PiAgICAvKioNCj4+PiAtICogc2RtYV92NV8wX3JpbmdfcGFkX2li
IC0gcGFkIHRoZSBJQiB0byB0aGUgcmVxdWlyZWQgbnVtYmVyIG9mIGR3DQo+Pj4gLSAqDQo+Pj4g
KyAqIHNkbWFfdjVfMF9yaW5nX3BhZF9pYiAtIHBhZCB0aGUgSUINCj4+PiAgICAgKiBAaWI6IGlu
ZGlyZWN0IGJ1ZmZlciB0byBmaWxsIHdpdGggcGFkZGluZw0KPj4+ICAgICAqDQo+Pj4gKyAqIFBh
ZCB0aGUgSUIgd2l0aCBOT1BzIHRvIGEgYm91bmRhcnkgbXVsdGlwbGUgb2YgOC4NCj4+PiAgICAg
Ki8NCj4+PiAgICBzdGF0aWMgdm9pZCBzZG1hX3Y1XzBfcmluZ19wYWRfaWIoc3RydWN0IGFtZGdw
dV9yaW5nICpyaW5nLCBzdHJ1Y3QgYW1kZ3B1X2liICppYikNCj4+PiAgICB7DQo+Pj4gQEAgLTEw
OTcsNyArMTEwMSw3IEBAIHN0YXRpYyB2b2lkIHNkbWFfdjVfMF9yaW5nX3BhZF9pYihzdHJ1Y3Qg
YW1kZ3B1X3JpbmcgKnJpbmcsIHN0cnVjdCBhbWRncHVfaWIgKmliDQo+Pj4gICAgCXUzMiBwYWRf
Y291bnQ7DQo+Pj4gICAgCWludCBpOw0KPj4+ICAgIA0KPj4+IC0JcGFkX2NvdW50ID0gKDggLSAo
aWItPmxlbmd0aF9kdyAmIDB4NykpICUgODsNCj4+PiArCXBhZF9jb3VudCA9ICgtaWItPmxlbmd0
aF9kdykgJiAweDc7DQo+Pj4gICAgCWZvciAoaSA9IDA7IGkgPCBwYWRfY291bnQ7IGkrKykNCj4+
PiAgICAJCWlmIChzZG1hICYmIHNkbWEtPmJ1cnN0X25vcCAmJiAoaSA9PSAwKSkNCj4+PiAgICAJ
CQlpYi0+cHRyW2liLT5sZW5ndGhfZHcrK10gPQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
