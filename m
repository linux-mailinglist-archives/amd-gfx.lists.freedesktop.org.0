Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D277CAFE29
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Sep 2019 15:56:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5FF6EB09;
	Wed, 11 Sep 2019 13:56:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720050.outbound.protection.outlook.com [40.107.72.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9D66EB09
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Sep 2019 13:56:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vm+bJPJhyXWsED7aDwGc8Q4HZXNxWvx6wFmnr7PpML/WPnJ3/ZZw7WGP/p1c1A3e6N0IO9Mt7SvA67MBT4OErmrHP7F1sdhr5oZgtaVHT4jDgQkV9OSahpvZeK2iA+E4DPXYUntnSsWvrTYLbw99joiBkOY1cQPOkDYwVyjtz+qRbryjL04xaKw28vVlXhNOhR9XR9gZwD4Vomw4lxARJZ+lX7xdzTh6pQS8vLVB/T6yQ8UM8YYHL+SmMz2Evjspvf2ffn08Nt2EssffCXuF+mTnsOh/Hb3puPwRUBuKg2dcvGkjQwbKeqJhiGTiE5HWUTSpXUwCDzkUTSpREY3KEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJKNiGCw9snSalGC8g0TiZU0muXHn2e4J9bBMpcmESY=;
 b=eXSyM06NcKSsjQMNVmtGx35s0e168hP+8D6mtSWU5SJv6DbWIM6dQ5DGImYNoaIlnTAmZEau6N/6bwS1H34tgXqzm5DSCHtutJRipV/2qyA2g2KU8qJuS6iuAHRQm1wk/PwXYOEid25q+NgZ5jUw/1t1PH3jseyyiMCO746C7gnMSFaI2Df15f2oTHuQLREmtbJzo6dUK4oz2k+e1rXiDsg38YZ1Au6DoJdsS8sZUJI9ONcY6F7H7TkuKbT4n0NYEGFgPHvLspBFCb//oR7aN4z5pgnAlCBfcTH3Sxug9woJYPrsQeGmvFu3iT554DPi/beW54VMAxKVtbPcvQ7DSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB2533.namprd12.prod.outlook.com (10.172.120.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Wed, 11 Sep 2019 13:56:28 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0%11]) with mapi id 15.20.2263.016; Wed, 11 Sep
 2019 13:56:28 +0000
From: Harry Wentland <hwentlan@amd.com>
To: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 00/20] HDCP 1.4 Content Protection
Thread-Topic: [PATCH 00/20] HDCP 1.4 Content Protection
Thread-Index: AQHVaArWVKzZ3/HFHU2yhXlmmYeWIKcmgVIA
Date: Wed, 11 Sep 2019 13:56:28 +0000
Message-ID: <01dff3e7-131b-5a06-b6a4-fae75f74f52a@amd.com>
References: <20190829162253.10195-10-Bhawanpreet.Lakha@amd.com>
 <20190910190554.1539-1-Bhawanpreet.Lakha@amd.com>
In-Reply-To: <20190910190554.1539-1-Bhawanpreet.Lakha@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
x-clientproxiedby: YT1PR01CA0010.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::23)
 To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 205604b0-727d-47a4-0c3c-08d736bfd757
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB2533; 
x-ms-traffictypediagnostic: CY4PR1201MB2533:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB253338152728C64ADAD774878CB10@CY4PR1201MB2533.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(346002)(39860400002)(366004)(189003)(199004)(66556008)(76176011)(11346002)(52116002)(6246003)(31696002)(256004)(316002)(2906002)(66476007)(6486002)(6512007)(66946007)(66446008)(8936002)(486006)(2616005)(186003)(36756003)(25786009)(476003)(99286004)(81166006)(386003)(53546011)(6506007)(102836004)(6436002)(8676002)(26005)(81156014)(71200400001)(71190400001)(7736002)(305945005)(110136005)(229853002)(53936002)(14444005)(2501003)(446003)(64756008)(5660300002)(66066001)(65806001)(6116002)(3846002)(31686004)(14454004)(58126008)(65956001)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2533;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EmL58Hr0cMdIQbHMf6auxi1auv9Bfy5tdXernf/tVTsUdV/DFyVhrC8mLMHBToRY0VBequaDPPM3k6b0JTemOMk2V/5nVeZmrSMAZapWxjt90iqLL6qA3xHDtWo4WDtuXlfzU62kIXLQW0g6+l4LAochj0k+TKa7TuzHs62+jeBd1miX4OuIxCnAMWSFyH/pDbOuq9IdzFU/7Qq0TZJ5JYIGELeVCUr/3XGisSL0Yb+pUZaRNu+j+9yCvnhvFKCwKAEkk1RICB/UoGDq/vTpMLYxchh8NI+ylyw6wAuS24b9GgcRI2if2mRweuAX+qm/YRpZ+eUCjsEuuhSsHqnt2y9oSrKgkSCeASo36u7CnlLHIjHLk0Y4CpNyVh0fsL1x4Co3csvb4A46VzJuif1cCLlokIXbi4NH17iObn7IUEk=
Content-ID: <75B03092338D8B4095CEA23B5BB74720@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 205604b0-727d-47a4-0c3c-08d736bfd757
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 13:56:28.2960 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IBc9OR7sixVjOM3B0P3DJhww/aa9P+m0yVWz9W2eTrkoRPPcCFQjkzAFdcxAEgFvuJjvRxWm8R4opOoIquDZ7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2533
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJKNiGCw9snSalGC8g0TiZU0muXHn2e4J9bBMpcmESY=;
 b=Oznq9E+QEQuiZRDZj1k51rHZTAq6OTHOYdSE+sqPgi1sHyspU3x9iGPvWAo2ZfMwxoguIfKW9oin6/HOPOmOBF0ZCnhVjNP+jHDRlIoMnR6abfrgAqYo0bvrEjJzzo9imbBqX4ftly6HHje6F3d5y4MZ4Gwns2a4+0mYDmP7rSs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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

T24gMjAxOS0wOS0xMCAzOjA1IHAubS4sIEJoYXdhbnByZWV0IExha2hhIHdyb3RlOg0KPiBUaGlz
IHBhdGNoIHNldCBpbnRyb2R1Y2VzIEhEQ1AgMS40IGNhcGFiaWxpdHkgdG8gQXNpY3Mgc3RhcnRp
bmcgd2l0aCAgUmF2ZW4oRENOIDEuMCkuDQo+IA0KPiBUaGlzIG9ubHkgaW50cm9kdWNlcyB0aGUg
YWJpbGl0eSB0byBhdXRoZW50aWNhdGUgYW5kIGVuY3J5cHQgdGhlIGxpbmsuIFRoZXNlDQo+IHBh
dGNoZXMgYnkgdGhlbXNlbHZlcyBkb24ndCBjb25zdGl0dXRlIGEgY29tcGxldGUgYW5kIGNvbXBs
aWFudA0KPiBIRENQIGNvbnRlbnQgcHJvdGVjdGlvbiBzb2x1dGlvbiBidXQgYXJlIGEgcmVxdWly
ZW1lbnQgZm9yIHN1Y2ggYSBzb2x1dGlvbi4NCj4gDQo+IE5PVEU6IFRoZSA3IHBhdGNoZXMgYnkg
UmFtYWxpbmdhbSBoYXZlIGFscmVhZHkgYmVlbiBtZXJnZWQgdG8gZHJtLW1pc2MNCj4gYnV0IGFy
ZSByZXF1aXJlZCB0byBhcHBseSB0aGUgSERDUCBwYXRjaGVzIG9uIGFtZC1zdGFnaW5nLWRybS1u
ZXh0DQo+IA0KDQpJcyB0aGVyZSBhbnkgY2hhbmdlIGZyb20gdGhlIHByZXZpb3VzIHNldCB0aGF0
IHdhcyBzZW50IG9uIEF1Z3VzdCAyOT8NCg0KUGxlYXNlIG1hcmsgcGF0Y2hlcyBhcyB2MiAoZ2l0
IGZvcm1hdC1wYXRjaCAtdjIpIGFuZCBub3RlIHdoYXQgY2hhbmdlZA0KaW4gdGhlIHBhdGNoIGRl
c2NyaXB0aW9uIGxpa2Ugc286DQoNCnYyOg0KIC0gZGlkIG9uZSBjaGFuZ2UgdG8gdGhlIHBhdGNo
DQogLSBjaGFuZ2VkIHNvbWV0aGluZyBlbHNlDQoNCkhhcnJ5DQoNCj4gQmhhd2FucHJlZXQgTGFr
aGEgKDEzKToNCj4gICBkcm0vYW1kZ3B1OiBwc3AgSERDUCBpbml0DQo+ICAgZHJtL2FtZGdwdTog
cHNwIERUTSBpbml0DQo+ICAgZHJtL2FtZC9kaXNwbGF5OiBBZGQgSERDUCBtb2R1bGUNCj4gICBk
cm0vYW1kL2Rpc3BsYXk6IGFkZCBQU1AgYmxvY2sgdG8gdmVyaWZ5IGhkY3Agc3RlcHMNCj4gICBk
cm0vYW1kL2Rpc3BsYXk6IFVwZGF0ZSBoZGNwIGRpc3BsYXkgY29uZmlnDQo+ICAgZHJtL2FtZC9k
aXNwbGF5OiBDcmVhdGUgYW1kZ3B1X2RtX2hkY3ANCj4gICBkcm0vYW1kL2Rpc3BsYXk6IENyZWF0
ZSBkcGNkIGFuZCBpMmMgcGFja2luZyBmdW5jdGlvbnMNCj4gICBkcm0vYW1kL2Rpc3BsYXk6IElu
aXRpYWxpemUgSERDUCB3b3JrIHF1ZXVlDQo+ICAgZHJtL2FtZC9kaXNwbGF5OiBIYW5kbGUgQ29u
dGVudCBwcm90ZWN0aW9uIHByb3BlcnR5IGNoYW5nZXMNCj4gICBkcm0vYW1kL2Rpc3BsYXk6IGhh
bmRsZSBEUCBjcGlycQ0KPiAgIGRybS9hbWQvZGlzcGxheTogVXBkYXRlIENQIHByb3BlcnR5IGJh
c2VkIG9uIEhXIHF1ZXJ5DQo+ICAgZHJtL2FtZC9kaXNwbGF5OiBvbmx5IGVuYWJsZSBIRENQIGZv
ciBEQ04rDQo+ICAgZHJtL2FtZC9kaXNwbGF5OiBBZGQgaGRjcCB0byBLY29uZmlnDQo+IA0KPiBS
YW1hbGluZ2FtIEMgKDcpOg0KPiAgIGRybTogbW92ZSBjb250ZW50IHByb3RlY3Rpb24gcHJvcGVy
dHkgdG8gbW9kZV9jb25maWcNCj4gICBkcm06IGdlbmVyaWMgZm4gY29udmVydGluZyBiZTI0IHRv
IGNwdSBhbmQgdmljZSB2ZXJzYQ0KPiAgIGRybTogcmV2b2NhdGlvbiBjaGVjayBhdCBkcm0gc3Vi
c3lzdGVtDQo+ICAgZHJtL2hkY3A6IGdhdGhlcmluZyBoZGNwIHJlbGF0ZWQgY29kZSBpbnRvIGRy
bV9oZGNwLmMNCj4gICBkcm06IEFkZCBDb250ZW50IHByb3RlY3Rpb24gdHlwZSBwcm9wZXJ0eQ0K
PiAgIGRybTogdWV2ZW50IGZvciBjb25uZWN0b3Igc3RhdHVzIGNoYW5nZQ0KPiAgIGRybS9oZGNw
OiB1cGRhdGUgY29udGVudCBwcm90ZWN0aW9uIHByb3BlcnR5IHdpdGggdWV2ZW50DQo+IA0KPiAg
RG9jdW1lbnRhdGlvbi9ncHUvZHJtLWttcy1oZWxwZXJzLnJzdCAgICAgICAgIHwgICA2ICsNCj4g
IGRyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQ0K
PiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jICAgICAgIHwgMzQzICsr
KysrKysrKystDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmggICAg
ICAgfCAgMzIgKysNCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5o
ICAgICB8ICAgNiArDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjEwXzAuYyAg
ICAgICAgfCAgNDAgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9LY29uZmlnICAg
ICAgICAgICB8ICAgOCArDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvTWFrZWZpbGUg
ICAgICAgICAgfCAgIDcgKw0KPiAgLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL01h
a2VmaWxlICAgIHwgICA0ICsNCj4gIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uYyB8IDEzNSArKysrKw0KPiAgLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbS5oIHwgICAzICsNCj4gIC4uLi9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtX2hkY3AuYyAgICB8IDM0MiArKysrKysrKysrKw0KPiAgLi4uL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG1faGRjcC5oICAgIHwgIDY2ICsrKw0KPiAgZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL01ha2VmaWxlICAgICAgIHwgICA0ICsNCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgICAgICB8ICAxMCArDQo+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMgfCAgMzEgKw0KPiAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggICAgICAgICAgIHwgICA1ICsNCj4gIGRyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY190eXBlcy5oICAgICB8ICAgNyArDQo+ICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1fY3BfcHNwLmggICAgfCAgNDkgKysNCj4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9oZGNwL01ha2VmaWxlICB8ICAyOCArDQo+ICAuLi4vZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9oZGNwL2hkY3BfbXNnLmMgICAgfCAzMjQgKysrKysrKysrKysN
Cj4gIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9jb3JlX3R5cGVzLmggICB8ICAgNCAr
LQ0KPiAgLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvaW5jbHVkZS9oZGNwX3R5cGVzLmggIHwgIDk2
ICsrKysNCj4gIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaGRjcC9NYWtlZmlsZSB8
ICAzMiArKw0KPiAgLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3AuYyAg
IHwgNDI2ICsrKysrKysrKysrKysrDQo+ICAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVz
L2hkY3AvaGRjcC5oICAgfCA0NDIgKysrKysrKysrKysrKysrDQo+ICAuLi4vZGlzcGxheS9tb2R1
bGVzL2hkY3AvaGRjcDFfZXhlY3V0aW9uLmMgICAgfCA1MzEgKysrKysrKysrKysrKysrKysrDQo+
ICAuLi4vZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcDFfdHJhbnNpdGlvbi5jICAgfCAzMDcgKysr
KysrKysrKw0KPiAgLi4uL2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcF9kZGMuYyAg
IHwgMzA1ICsrKysrKysrKysNCj4gIC4uLi9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hk
Y3BfbG9nLmMgICB8IDE2MyArKysrKysNCj4gIC4uLi9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9o
ZGNwL2hkY3BfbG9nLmggICB8IDEzOSArKysrKw0KPiAgLi4uL2RybS9hbWQvZGlzcGxheS9tb2R1
bGVzL2hkY3AvaGRjcF9wc3AuYyAgIHwgMzI4ICsrKysrKysrKysrDQo+ICAuLi4vZHJtL2FtZC9k
aXNwbGF5L21vZHVsZXMvaGRjcC9oZGNwX3BzcC5oICAgfCAyNzIgKysrKysrKysrDQo+ICAuLi4v
ZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaW5jL21vZF9oZGNwLmggICAgfCAyODkgKysrKysrKysr
Kw0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfdWFwaS5jICAgICAgICAgICAgIHwgICA4
ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jICAgICAgICAgICAgICAgfCAx
MTEgKystLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9oZGNwLmMgICAgICAgICAgICAgICAgICAg
IHwgNDQ4ICsrKysrKysrKysrKysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9pbnRlcm5hbC5o
ICAgICAgICAgICAgICAgIHwgICA0ICsNCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3lzZnMuYyAg
ICAgICAgICAgICAgICAgICB8ICAzNyArKw0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxf
aGRjcC5jICAgICAgICAgICAgIHwgICA5ICstDQo+ICBkcml2ZXJzL21pc2MvbWVpL2hkY3AvbWVp
X2hkY3AuYyAgICAgICAgICAgICAgfCAgIDIgKy0NCj4gIGluY2x1ZGUvZHJtL2RybV9jb25uZWN0
b3IuaCAgICAgICAgICAgICAgICAgICB8ICAxNSArLQ0KPiAgaW5jbHVkZS9kcm0vZHJtX2hkY3Au
aCAgICAgICAgICAgICAgICAgICAgICAgIHwgIDM4ICstDQo+ICBpbmNsdWRlL2RybS9kcm1fbW9k
ZV9jb25maWcuaCAgICAgICAgICAgICAgICAgfCAgMTIgKw0KPiAgaW5jbHVkZS9kcm0vZHJtX3N5
c2ZzLmggICAgICAgICAgICAgICAgICAgICAgIHwgICA1ICstDQo+ICA0NSBmaWxlcyBjaGFuZ2Vk
LCA1NDA3IGluc2VydGlvbnMoKyksIDY4IGRlbGV0aW9ucygtKQ0KPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hkY3Au
Yw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtX2hkY3AuaA0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kbV9jcF9wc3AuaA0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9oZGNwL01ha2VmaWxlDQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2hkY3AvaGRjcF9tc2cuYw0K
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9pbmNsdWRl
L2hkY3BfdHlwZXMuaA0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9tb2R1bGVzL2hkY3AvTWFrZWZpbGUNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3AuYw0KPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcC5o
DQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVs
ZXMvaGRjcC9oZGNwMV9leGVjdXRpb24uYw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcDFfdHJhbnNpdGlvbi5jDQo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaGRj
cC9oZGNwX2RkYy5jDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L21vZHVsZXMvaGRjcC9oZGNwX2xvZy5jDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaGRjcC9oZGNwX2xvZy5oDQo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaGRjcC9o
ZGNwX3BzcC5jDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L21vZHVsZXMvaGRjcC9oZGNwX3BzcC5oDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaW5jL21vZF9oZGNwLmgNCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vZHJtX2hkY3AuYw0KPiANCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
