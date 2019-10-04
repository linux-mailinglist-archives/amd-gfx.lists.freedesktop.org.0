Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5A1CBE7E
	for <lists+amd-gfx@lfdr.de>; Fri,  4 Oct 2019 17:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360856EBC5;
	Fri,  4 Oct 2019 15:05:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690046.outbound.protection.outlook.com [40.107.69.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE376EB12
 for <amd-gfx@lists.freedesktop.org>; Fri,  4 Oct 2019 15:05:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fpA3yWQpPBHIiLPv0SdbXFNju/REHObWUU7AfAlgF2g7j9jFXVbyyzhMVYS6EFkl2BPijLKCKbgtqea8y5WIs8SofFTx3A8qCxRn7a3xx6JD05vdjiOrQsOky+0T+Vuyf5Zy6vtgtHPalR2JsOu3kDbEPIx4h3r5W5rSAJKJ4RXKuf0C5Fq6hbr4l1U1gCn/Zbe2PeptqZtVT30W8i6NPWtMRkk885s+ZojYs7A2NDStlTRuKBvJ9ivPk0hMWZOJf2L3CjIZXsC8xqiCp9pUfwixRXn5GM4N+eB4/6z3K0DkWVVn8sOiq4dcwfSvaWHzoCLFVZ1RB2fscVflC+PD4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJtRDeW/ZpUNget7rNPVPhu4L+LtWfLBTQuib4p1SAo=;
 b=bZ3EHlm25YMilWr+3ZoIyX9JJDskjrI6B/v5Bthz5CbiU5qDtfQrC6neGUfbJuBRlNQqO22ft3pcr3UGYaIAePeGIiRjjYENkuE42ndbjjWNrIQEa7HMdCnwwtJIJRHrdrvfmIpzju6Vx+RxlT7+1TAjJ0hM1KFt6vIqEd8PqKQQA1vGpg52fHgzGAijoVqxtZgy3M9B9jLDqRScAeJngHGwSOZHUVcmRvjEGrKk3xDRgXRoNjWus1Ibv3h9TbsnIXbTq9MAEF33HxFCGfh/8rMoxZ4TH31EKfWr/nX/wDaoq1efFs2VoBIuj1/zhbTeNVuqDqxp84c+TmW/G5P9cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0071.namprd12.prod.outlook.com (10.172.79.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 4 Oct 2019 15:05:40 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61%7]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 15:05:40 +0000
From: Harry Wentland <hwentlan@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/display: Make plane z-pos explicit to userspace
Thread-Topic: [PATCH] drm/amd/display: Make plane z-pos explicit to userspace
Thread-Index: AQHVeflUz3CcpdreVkq1OMMCcKNnoadKlmiA
Date: Fri, 4 Oct 2019 15:05:40 +0000
Message-ID: <3607d501-00f2-4665-4890-26b89259867f@amd.com>
References: <20191003144606.8550-1-nicholas.kazlauskas@amd.com>
In-Reply-To: <20191003144606.8550-1-nicholas.kazlauskas@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [132.205.229.214]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
x-clientproxiedby: YQBPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::26) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 813348b7-bd60-4097-7a1b-08d748dc51d5
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY4PR1201MB0071:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB00710C271127A3B1D1DE476E8C9E0@CY4PR1201MB0071.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(199004)(189003)(102836004)(5660300002)(14454004)(99286004)(2501003)(229853002)(186003)(6512007)(71200400001)(6506007)(53546011)(31686004)(386003)(76176011)(52116002)(71190400001)(26005)(14444005)(6436002)(5024004)(486006)(256004)(6486002)(478600001)(316002)(58126008)(110136005)(66946007)(2906002)(64756008)(54906003)(66446008)(66556008)(66476007)(11346002)(81156014)(4326008)(476003)(66066001)(2616005)(65956001)(65806001)(6116002)(7736002)(3846002)(446003)(8676002)(31696002)(8936002)(6246003)(81166006)(36756003)(25786009)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0071;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bAXZp8LAv9vuJUpYWvhQiZLJ/y0dFwDeP/wmuujT/4bLxuCx20NrBTJYduk8PRnMatqI9ZYpdZTFlaR17VK2UlWD+EAhItZwW0sh7Cvuyv4Hzz/WnQQa0C6jZRcmqJPnwPzpjww5a3shwXycSbXPahao/I4RqUkMKPuBmPuiNU4cUBDaO0U9Hlqxof/jrwD4V1bKfL76dTgHZ1Zr8ZvHSfJJu277twsSn/Mv1HMaq+GSnfD6DfJBol2jQJ4+BObV8pRpZJMxuFR+dqGKld+P8KyKpJbOhBPzRr2Xf+zyeZI62ZH6B5cNLOQGDNB3s4CB0QWlGgGXY8k5VeEici9XlRuTk9mkZP96i473FX5RFchckiMF4WIgERai5uPFFN8HXJOs1Xit6KTBsoZJodesUsnMOrKhTdhD2MtuPTzFB6c=
Content-ID: <3C273E6757C54248902F943337F88D05@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 813348b7-bd60-4097-7a1b-08d748dc51d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 15:05:40.2233 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lmfJX3R4FdimVKpTFa14Xsyok7KD3yyBMJEmXJG2WFHFl7yBeAPqOmMg94yL/g5zIbkbSZ80XHBrW1zrwaPWpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0071
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJtRDeW/ZpUNget7rNPVPhu4L+LtWfLBTQuib4p1SAo=;
 b=SGqZGtv7euXWIX/dI+84vsO1jHKcihZAbBGwOuKGdC0bJY6bmMcTJntlgovE9B7QhbsxWkRFNdnV1AEvQCwBgtNHVN/G8I9C8W+PyatKlZCKJ+cHtBjtLOJs8gVYs/Yk8Y15XbmnIoL1dyrKT4YpryGECFDKeOTerhLYsvStlr8=
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0wMyAxMDo0NiBhLm0uLCBOaWNob2xhcyBLYXpsYXVza2FzIHdyb3RlOg0KPiBb
V2h5XQ0KPiBNYW55IHVzZXJzcGFjZSBhc3N1bWVzIHRoYXQgdGhlIERSTSBwbGFuZSBpbmRleCBp
bmRpY2F0ZXMgdGhlIHBsYW5lDQo+IHotb3JkZXIsIHdpdGggYSBsb3dlciBpbmRleCBiZWluZyBs
b3dlciBkZXB0aCBhbmQgYSBoaWdoZXIgaW5kZXggYmVpbmcNCj4gaGlnaGVyIGRlcHRoLiBUaGlz
IGlzIGN1cnJlbnRseSB3aGF0IHdlIGFzc3VtZSBpbiBETS4NCj4gDQo+IERSTSBoYXMgYSB6cG9z
IHBsYW5lIHByb3BlcnR5IHRvIG1ha2UgdGhpcyBleHBsaWNpdCB0byB1c2Vyc3BhY2UgYW5kDQo+
IHRoZXJlIGFyZSBjbGllbnRzIHRoYXQgbWFrZSB1c2Ugb2YgdGhpcyBpbmZvcm1hdGlvbi4NCj4g
DQo+IFtIb3ddDQo+IEF0dGFjaCB0aGUgaW1tdXRhYmxlIHpwb3MgcHJvcGVydHkgdG8gdGhlIHBs
YW5lLg0KPiANCj4gV2hpbGUgd2UgY2FuIHRlY2huaWNhbGx5IG9yZGVyIHRoZSBwbGFuZXMgaW4g
YW55IG1hbm5lciBzaW5jZSB3ZQ0KPiB2aXJ0dWFsaXplIHRoZW0gaW4gREMgd2UgZG9uJ3QgY3Vy
cmVudGx5IGhhdmUgdGhlIHNvZnR3YXJlIHN1cHBvcnQuDQo+IA0KPiBUaGUgei1wb3MgY291bGQg
cG90ZW50aWFsbHkgYmVjb21lIGltbXV0YWJsZSBsYXRlciBidXQgZm9yIG5vdw0KPiBqdXN0IGxl
dCB1c2Vyc3BhY2UgZG8gdGhlIG9yZGVyaW5nLg0KPiANCj4gQ2M6IExlbyBMaSA8c3VucGVuZy5s
aUBhbWQuY29tPg0KPiBDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+
DQo+IENjOiBSb2RyaWdvIFNpcXVlaXJhIDxyb2RyaWdvLnNpcXVlaXJhQGFtZC5jb20+DQo+IFNp
Z25lZC1vZmYtYnk6IE5pY2hvbGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1k
LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQu
Y29tPg0KDQpIYXJyeQ0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG0uYyB8IDMgKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtLmMNCj4gaW5kZXggMjM5YjFhZTg2MDA3Li5lNThiMGI3ZTNjNTIgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uYw0KPiBAQCAtNDg5Nyw2ICs0ODk3LDkgQEAgc3RhdGljIGludCBhbWRncHVfZG1fcGxhbmVf
aW5pdChzdHJ1Y3QgYW1kZ3B1X2Rpc3BsYXlfbWFuYWdlciAqZG0sDQo+ICAJaWYgKHJlcykNCj4g
IAkJcmV0dXJuIHJlczsNCj4gIA0KPiArCS8qIE1ha2Ugei1wb3Mgb2YgZWFjaCBwbGFuZSBleHBs
aWNpdCAtIGxvd2VyIElEIGlzIGxvd2VyIGRlcHRoICovDQo+ICsJZHJtX3BsYW5lX2NyZWF0ZV96
cG9zX2ltbXV0YWJsZV9wcm9wZXJ0eShwbGFuZSwgcGxhbmUtPmluZGV4KTsNCj4gKw0KPiAgCWlm
IChwbGFuZS0+dHlwZSA9PSBEUk1fUExBTkVfVFlQRV9PVkVSTEFZICYmDQo+ICAJICAgIHBsYW5l
X2NhcCAmJiBwbGFuZV9jYXAtPnBlcl9waXhlbF9hbHBoYSkgew0KPiAgCQl1bnNpZ25lZCBpbnQg
YmxlbmRfY2FwcyA9IEJJVChEUk1fTU9ERV9CTEVORF9QSVhFTF9OT05FKSB8DQo+IA0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
