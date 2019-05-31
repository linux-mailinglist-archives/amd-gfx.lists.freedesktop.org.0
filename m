Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FF1315C7
	for <lists+amd-gfx@lfdr.de>; Fri, 31 May 2019 22:04:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC9A89906;
	Fri, 31 May 2019 20:04:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720076.outbound.protection.outlook.com [40.107.72.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C228D89906
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 20:04:13 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3435.namprd12.prod.outlook.com (20.178.198.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.17; Fri, 31 May 2019 20:04:11 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1922.021; Fri, 31 May 2019
 20:04:11 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 6/8] drm/amdkfd: New IOCTL to allocate queue GWS
Thread-Topic: [PATCH 6/8] drm/amdkfd: New IOCTL to allocate queue GWS
Thread-Index: AQHVEbimTTWAfIcqrkueX5oyj1CRRqZ6r9UAgAnqagCAARpTgA==
Date: Fri, 31 May 2019 20:04:11 +0000
Message-ID: <e857f0f4-341d-1e64-0ffe-5b6812ca5b7f@amd.com>
References: <1558651263-3478-1-git-send-email-Oak.Zeng@amd.com>
 <1558651263-3478-6-git-send-email-Oak.Zeng@amd.com>
 <4f49af4d-0953-030c-bb1b-47b7a5fa7c7c@amd.com>
 <CAPM=9tzs9adV7_ef4hpgswB-S==iQizAF_=FTarVm3EYwPCg0w@mail.gmail.com>
In-Reply-To: <CAPM=9tzs9adV7_ef4hpgswB-S==iQizAF_=FTarVm3EYwPCg0w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: YTXPR0101CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::32) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f70c06cb-fb1c-4111-5a4c-08d6e6032598
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3435; 
x-ms-traffictypediagnostic: DM6PR12MB3435:
x-microsoft-antispam-prvs: <DM6PR12MB3435E218A82C5D7E7424977E92190@DM6PR12MB3435.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00540983E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(376002)(396003)(136003)(39860400002)(199004)(189003)(53936002)(58126008)(66946007)(53546011)(99286004)(446003)(81166006)(81156014)(7736002)(8676002)(26005)(14454004)(54906003)(11346002)(8936002)(73956011)(6436002)(6506007)(66476007)(386003)(486006)(476003)(2616005)(72206003)(186003)(25786009)(6486002)(478600001)(5660300002)(305945005)(1411001)(52116002)(4326008)(66556008)(64756008)(66446008)(36756003)(14444005)(86362001)(71190400001)(65806001)(66066001)(65956001)(6916009)(6512007)(31696002)(65826007)(71200400001)(68736007)(256004)(64126003)(6246003)(6116002)(102836004)(3846002)(2906002)(31686004)(229853002)(316002)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3435;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Gj0DWzIQHb4hGDnsImgjySF5DTUCDvCKwnC2459G6698OeN5Zote/WHfHH6/oLWAvt9FtmevRLNA1246HmbQi21VsVfOaWyyj4EyHXt5lsrloneX2RXzL7SFq3a79ARGcanaU4X1fOFNOzEdUEeKPpfScG/JFrCKbOvgQbdds8iaREe+vS8/RfJ5Yy+loFw8N/vl7Oa6rFeDOj+RALDgl6c51uVe6f0cR0a0xirZ6Md7tH9VbyBJfTsJTTi7jDqlPDcw1IlYuW0gImPH9IkPdykNtT/kNawdcGzukmCd9rKtj/zw4tq2L18HqTFtHR+CprRXoOMTO3hdGTqjjM6IAS2y9OMcfakb6RLC6vP+YyELorlA7stcqZAYoAFYAbmlHkpLgEC06PQrzTNCYJgQszSQcdsvARzMfjpPmv3bwyo=
Content-ID: <F954250BD858554AB4E3DFEE323AC8CD@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f70c06cb-fb1c-4111-5a4c-08d6e6032598
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2019 20:04:11.1604 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3435
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Yja9Y6K24sdbFE0/P6UmpzWGjofuhxupRhcvVzWSiI=;
 b=MpjKFPpELNTxcZ/neC7Qj0R6iBpsoYuVaNigHmqI6mSZ78Ax0zb5enudw9Fog+eOk7RxAQuxK/wd9MReMiHqEahSxi0RmnVjt4tD9d/6LRzsG1eS+0CyCJw4VSL9yRr7vldMolOvXTsiql2a2Q0A518wEkR3Dkb5fAYCg3d3pHQ=
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>, "Keely, Sean" <Sean.Keely@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0zMCAxMToxMyBwLm0uLCBEYXZlIEFpcmxpZSB3cm90ZToNCj4gT24gU2F0LCAy
NSBNYXkgMjAxOSBhdCAwNTo0OCwgS3VlaGxpbmcsIEZlbGl4IDxGZWxpeC5LdWVobGluZ0BhbWQu
Y29tPiB3cm90ZToNCj4+IE9uIDIwMTktMDUtMjMgNjo0MSBwLm0uLCBaZW5nLCBPYWsgd3JvdGU6
DQo+Pj4gQWRkIGEgbmV3IGtmZCBpb2N0bCB0byBhbGxvY2F0ZSBxdWV1ZSBHV1MuIFF1ZXVlDQo+
Pj4gR1dTIGlzIHJlbGVhc2VkIG9uIHF1ZXVlIGRlc3Ryb3kuDQo+Pj4NCj4+PiBDaGFuZ2UtSWQ6
IEk2MDE1M2MyNmE1Nzc5OTJhZDg3M2U0MjkyZTc1OWU1YzNkNWJiZDE1DQo+Pj4gU2lnbmVkLW9m
Zi1ieTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+DQo+PiBSZXZpZXdlZC1ieTogRmVsaXgg
S3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQo+Pg0KPiBidHcganVzdCBub3RpY2Vk
IGluIHBhc3Npbmcgd2UgYXJlIGFkZGluZyBuZXcgZmVhdHVyZXMgdG8ga2ZkLCBpcw0KPiB0aGVy
ZSBhbiBvcGVuIHNvdXJjZSBkZXZlbG9wZWQgdXNlcnNwYWNlIHRvIGdvIGFsb25nIHdpdGggdGhp
cywgdGhlcmUNCj4gbmVlZHMgdG8gYSBkZXYgYnJhbmNoIGluIHB1YmxpYyBiZWZvcmUgbmV3IGlv
Y3Rscy91YXBpIHN1cmZhY2VzIHNob3VsZA0KPiBiZSBhZGRlZCB0byB0aGUga2VybmVsLg0KPg0K
PiBUaGUgY29tbWl0cyBzaG91bGQgcHJvYmFibHkgaGF2ZSBwb2ludGVycyB0byB0aGF0IGJyYW5j
aC4NCg0KQWgsIGEgY2hpY2tlbiBhbmQgZWdnIHByb2JsZW0uIEkgdGhpbmsgdGhpcyBpcyB0aGUg
Zmlyc3QgdGltZSB3ZSdyZSANCmFkZGluZyBhIG5ldyBpb2N0bCB0byB1cHN0cmVhbSBLRkQgcmF0
aGVyIHRoYW4gdXBzdHJlYW1pbmcgb25lIHRoYXQncyANCmJlZW4gZGV2ZWxvcGVkIGludGVybmFs
bHkgZmlyc3QuIE1heWJlIG5vdCB0aGUgcmlnaHQgd2F5IHRvIGRvIGl0Lg0KDQpJIHNob3VsZCBi
ZSBhYmxlIHRvIHB1Ymxpc2ggdGhlIHVzZXIgbW9kZSBjb2RlIGluIGxpYmhzYWttdCBuZXh0IHdl
ZWsuIA0KVGhlbiB3ZSdsbCB3b3JrIG9uIGEga2ZkdGVzdCB0byB2YWxpZGF0ZSB0aGUgZmlybXdh
cmUgZnVuY3Rpb25hbGl0eS4gDQpGaW5hbGx5IHdlJ2xsIHVzZSBHV1MgZnVydGhlciB1cCB0aGUg
c29mdHdhcmUgc3RhY2sgZm9yIHN5bmNocm9uaXphdGlvbiANCm9mIGNvbmN1cnJlbnQgY29tcHV0
ZSB3b3JrZ3JvdXBzLg0KDQpSZWdhcmRzLA0KIMKgIEZlbGl4DQoNCg0KPg0KPiBEYXZlLg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
