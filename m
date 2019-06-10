Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB6E3BFE2
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Jun 2019 01:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3601988FB2;
	Mon, 10 Jun 2019 23:35:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810052.outbound.protection.outlook.com [40.107.81.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5755588FB2
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Jun 2019 23:35:31 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3163.namprd12.prod.outlook.com (20.179.104.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.17; Mon, 10 Jun 2019 23:35:30 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1965.017; Mon, 10 Jun 2019
 23:35:30 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amdkfd: Initialize HSA_CAP_ATS_PRESENT capability
 in topology codes
Thread-Topic: [PATCH 1/2] drm/amdkfd: Initialize HSA_CAP_ATS_PRESENT
 capability in topology codes
Thread-Index: AQHVH83hqzPvNroasUKFWS4+jNr7AaaVisGA
Date: Mon, 10 Jun 2019 23:35:30 +0000
Message-ID: <82bec9b4-5f67-1190-62ea-a8b50269d63a@amd.com>
References: <1560199712-15472-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1560199712-15472-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.53.123]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: BYAPR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::34) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9163e105-cfba-48e0-a45f-08d6edfc52d6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3163; 
x-ms-traffictypediagnostic: DM6PR12MB3163:
x-microsoft-antispam-prvs: <DM6PR12MB3163503045ACB3F7D279615E92130@DM6PR12MB3163.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(136003)(39860400002)(366004)(346002)(189003)(199004)(186003)(68736007)(73956011)(6246003)(53936002)(476003)(486006)(2616005)(26005)(4326008)(66556008)(64756008)(66946007)(256004)(66446008)(66476007)(6506007)(7736002)(53546011)(386003)(66066001)(102836004)(99286004)(65956001)(65806001)(5660300002)(76176011)(52116002)(11346002)(446003)(229853002)(6436002)(64126003)(110136005)(58126008)(25786009)(6486002)(305945005)(6512007)(8936002)(71200400001)(2906002)(86362001)(81166006)(81156014)(8676002)(72206003)(478600001)(2501003)(31686004)(31696002)(71190400001)(36756003)(316002)(14454004)(3846002)(6116002)(65826007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3163;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2uA/xV+UKxPIv650pv8TupgQ9h6mhJ0WkQWeFiIFWHccCZFD0uXEHg1/sWwdRw01Yr4315/62JjTMkJrQoumteucMbSHeHsezVBK8Sn2NRWfkMKKz7aGicWW0DY5v3ML0T2mJNR/NNWL5R8x17tRsJhyvVBsOR2DIJr9+s2NutE/x5wHvWTt9M37dMN8wAZyopTup1yYVM7rWnxcu5UBwGIHLwNQYag5aOl41dRai2msanlrmcPCOEYbuR0Ooa4sV/LLdecOGV4q9kuBdg00/XFVCsBYbyDwDGULXudduBEZF5sqE3iMRdwHqYttUf9XNt4ZwvdTezLh+Ivi3+b+OGPXTdziME3ywTxw0okqlAC6P89psSWaM3vDd+95tC3cnGk/xqOQeLLtsD5FbaBXZ/vbchT82KuO4Qo176LKn7w=
Content-ID: <C4189F7B365CD241A3EE70873DD7D7B7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9163e105-cfba-48e0-a45f-08d6edfc52d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 23:35:30.0571 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3163
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2wG2RtDVEm+RBPbOpkTGJiKwtvqcWXORARjVdJ6qHM=;
 b=MI6WcRzjyW8UDpgffxh0rw+BXFB7UkZOpmjIBwEXVcrZ3h9KnHRs8NvU87Vk+Z+69kXLVG7dB5733LOBmJgauh20bwFBDaMZ3+izB9N4DlIIcAUxPJywVhwBeSGzmxJTXlH+caE4NsUkXbLkwfM6dmbIyPj8WkdIsvQSLJMiSIg=
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQpPbiAyMDE5LTA2LTEwIDEzOjQ4LCBaZW5nLCBPYWsgd3JvdGU6DQo+IE1vdmUgSFNBX0NBUF9B
VFNfUFJFU0VOVCBpbml0aWFsaXphdGlvbiBsb2dpYyBmcm9tIGtmZCBpb21tdSBjb2RlcyB0bw0K
PiBrZmQgdG9wb2xvZ3kgY29kZXMuIFRoaXMgcmVtb3ZlcyBrZmRfaW9tbXVfZGV2aWNlX2luaXQn
cyBkZXBlbmRlbmN5DQo+IG9uIGtmZF90b3BvbG9neV9hZGRfZGV2aWNlLiBBbHNvIHJlbW92ZSBk
dXBsaWNhdGUgY29kZSBzZXR0aW5nIHRoZQ0KPiBzYW1lLg0KPg0KPiBDaGFuZ2UtSWQ6IEkyYmYz
YzAwMGQ0Nzk1YjQxYWZlMWIzOWZlNjc5Njc3YzFmODZiZmJlDQo+IFNpZ25lZC1vZmYtYnk6IE9h
ayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfaW9tbXUuYyAgICB8IDEwICstLS0tLS0tLS0NCj4gICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfdG9wb2xvZ3kuYyB8ICA2ICsrKysrLQ0KPiAgIDIgZmlsZXMgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9pb21tdS5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX2lvbW11LmMNCj4gaW5kZXggMDE0OTQ3NS4uNWYzNWRmMiAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2lvbW11LmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2lvbW11LmMNCj4gQEAgLTY2LDE2ICs2Niw4
IEBAIGludCBrZmRfaW9tbXVfZGV2aWNlX2luaXQoc3RydWN0IGtmZF9kZXYgKmtmZCkNCj4gICAN
Cj4gICAJdG9wX2RldiA9IGtmZF90b3BvbG9neV9kZXZpY2VfYnlfaWQoa2ZkLT5pZCk7DQo+ICAg
DQo+IC0JLyoNCj4gLQkgKiBPdmVyd3JpdGUgQVRTIGNhcGFiaWxpdHkgYWNjb3JkaW5nIHRvIG5l
ZWRzX2lvbW11X2RldmljZSB0byBmaXgNCj4gLQkgKiBwb3RlbnRpYWwgbWlzc2luZyBjb3JyZXNw
b25kaW5nIGJpdCBpbiBDUkFUIG9mIEJJT1MuDQo+IC0JICovDQoNCkl0IHdvdWxkIGJlIGdvb2Qg
dG8gcHJlc2VydmUgdGhpcyBjb21tZW50IGJ5IG1vdmluZyBpdCB0byANCmtmZF90b3BvbG9neV9h
ZGRfZGV2aWNlLg0KDQoNCj4gLQlpZiAoIWtmZC0+ZGV2aWNlX2luZm8tPm5lZWRzX2lvbW11X2Rl
dmljZSkgew0KPiAtCQl0b3BfZGV2LT5ub2RlX3Byb3BzLmNhcGFiaWxpdHkgJj0gfkhTQV9DQVBf
QVRTX1BSRVNFTlQ7DQo+ICsJaWYgKCFrZmQtPmRldmljZV9pbmZvLT5uZWVkc19pb21tdV9kZXZp
Y2UpDQo+ICAgCQlyZXR1cm4gMDsNCj4gLQl9DQo+IC0NCj4gLQl0b3BfZGV2LT5ub2RlX3Byb3Bz
LmNhcGFiaWxpdHkgfD0gSFNBX0NBUF9BVFNfUFJFU0VOVDsNCj4gICANCj4gICAJaW9tbXVfaW5m
by5mbGFncyA9IDA7DQo+ICAgCWVyciA9IGFtZF9pb21tdV9kZXZpY2VfaW5mbyhrZmQtPnBkZXYs
ICZpb21tdV9pbmZvKTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3RvcG9sb2d5
LmMNCj4gaW5kZXggZDI0MWE4Ni4uMWMxODRiMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX3RvcG9sb2d5LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX3RvcG9sb2d5LmMNCj4gQEAgLTEzMzAsNiArMTMzMCwxMSBAQCBpbnQga2Zk
X3RvcG9sb2d5X2FkZF9kZXZpY2Uoc3RydWN0IGtmZF9kZXYgKmdwdSkNCj4gICAJCSAgICAgZGV2
LT5ncHUtPmRldmljZV9pbmZvLT5hc2ljX2ZhbWlseSk7DQo+ICAgCX0NCj4gICANCj4gKwlpZiAo
ZGV2LT5ncHUtPmRldmljZV9pbmZvLT5uZWVkc19pb21tdV9kZXZpY2UpDQo+ICsJCWRldi0+bm9k
ZV9wcm9wcy5jYXBhYmlsaXR5IHw9IEhTQV9DQVBfQVRTX1BSRVNFTlQ7DQo+ICsJZWxzZQ0KPiAr
CQlkZXYtPm5vZGVfcHJvcHMuY2FwYWJpbGl0eSAmPSB+SFNBX0NBUF9BVFNfUFJFU0VOVDsNCj4g
Kw0KPiAgIAkvKiBGaXggZXJyb3JzIGluIENaIENSQVQuDQo+ICAgCSAqIHNpbWRfY291bnQ6IENh
cnJpem8gQ1JBVCByZXBvcnRzIHdyb25nIHNpbWRfY291bnQsIHByb2JhYmx5DQo+ICAgCSAqCQli
ZWNhdXNlIGl0IGRvZXNuJ3QgY29uc2lkZXIgbWFza2VkIG91dCBDVXMNCj4gQEAgLTEzNDAsNyAr
MTM0NSw2IEBAIGludCBrZmRfdG9wb2xvZ3lfYWRkX2RldmljZShzdHJ1Y3Qga2ZkX2RldiAqZ3B1
KQ0KPiAgIAkJZGV2LT5ub2RlX3Byb3BzLnNpbWRfY291bnQgPQ0KPiAgIAkJCWN1X2luZm8uc2lt
ZF9wZXJfY3UgKiBjdV9pbmZvLmN1X2FjdGl2ZV9udW1iZXI7DQo+ICAgCQlkZXYtPm5vZGVfcHJv
cHMubWF4X3dhdmVzX3Blcl9zaW1kID0gMTA7DQo+IC0JCWRldi0+bm9kZV9wcm9wcy5jYXBhYmls
aXR5IHw9IEhTQV9DQVBfQVRTX1BSRVNFTlQ7DQoNClRoZXJlIGlzIGEgY29tbWVudCBhYm92ZSB0
aGUgaWYtYmxvY2sgdGhhdCBzaG91bGQgYmUgdXBkYXRlZCB3aGVuIHlvdSANCnJlbW92ZSB0aGlz
Lg0KDQpXaXRoIHRoZXNlIHR3byBjb21tZW50cyBmaXhlZCwgdGhlIHNlcmllcyBpcyBSZXZpZXdl
ZC1ieTogRmVsaXggS3VlaGxpbmcgDQo8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCg0KUmVnYXJk
cywNCiDCoCBGZWxpeA0KDQoNCj4gICAJfQ0KPiAgIA0KPiAgIAljdHggPSBhbWRncHVfcmFzX2dl
dF9jb250ZXh0KChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKShkZXYtPmdwdS0+a2dkKSk7DQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
