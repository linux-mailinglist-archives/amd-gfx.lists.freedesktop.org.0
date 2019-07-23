Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 756057153F
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 11:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EDB989A56;
	Tue, 23 Jul 2019 09:33:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720086.outbound.protection.outlook.com [40.107.72.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DBE89A56
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 09:33:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cFwY0/Bf33PY23/x879bIJeThRgbT3ZTbc1di53tAWB4gIpshqD3vKSbL4IBPT+eob9ojy2pJ7l2JmVA0vgFYeSEDWLAUUsKJ3Dq9bK+pLHZFc12TXeOYLkmRMFv6o+KLNfm7VtekWbcw5Qz1OGExbRKZDgRvrj8d1D+e98BIgXy5TyhBKFVVmuF0kQNclrtG30/JrKSbM6dLnmP3XtGryz9V6y8+RZUe0w1Npr+tZ+LJWK9FBBoTRSc9i4H0uRYl5UVhgWtaklVmtX/HvUp39lQtdwTaBRIt/3C0r7X1ODMCiJ8ixu9Yil5kYb8noSSPvLe6KaPP8ZsUStotB+j6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzY6U6SmM17+Y+M/EqD3amL0IeLDHlAfKAjz/V8H2FU=;
 b=DwMFEgF8qphiMrXZalg9wb7jCznSq3aHsnz4hzUFVu31RJtr2p30RWo1llm70WbiuO37pTo1PUmNTmygwclkLb/VjcWiitaPpC6RLtnxmTltf1G993MatX/Ia7HjppqduorclCknQii9z8VQ+vCpgFqLEkNUTHXp44NA4WKmWc1feOOfQW/Etaml9hACyBTKwltd65rLSbL9z/s3KKlY8CtGYsTk+zq6EKlB74MQECiQ3gNY71PtrKexemHJT15RthxCwFUe8z9t4lWkCbCVYYYTYqBcIp5lDshqXxhvGrR0J9jpOEuQLRSmq0aGK7T463WG/kK/hxyGxubtiBNbAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3229.namprd12.prod.outlook.com (20.179.82.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Tue, 23 Jul 2019 09:33:05 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f%6]) with mapi id 15.20.2094.013; Tue, 23 Jul 2019
 09:33:05 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: =?gb2312?B?s7e72DogW1BBVENIIHYyXSBkcm0vYW1kL3Bvd2VycGxheTogYWRkIGhlbHBl?=
 =?gb2312?B?ciBvZiBzbXVfY2xrX2RwbV9pc19lbmFibGVkIGZvciBzbXU=?=
Thread-Topic: [PATCH v2] drm/amd/powerplay: add helper of
 smu_clk_dpm_is_enabled for smu
Thread-Index: AQHVQTmgV5GTQwhEIE2v6r0Ojbk7/w==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 35
X-FaxNumberOfPages: 0
Date: Tue, 23 Jul 2019 09:33:04 +0000
Message-ID: <MN2PR12MB329690FC5360CD9230F47BA0A2C70@MN2PR12MB3296.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3c61549-7713-40f0-0bb0-08d70f50c3b9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3229; 
x-ms-traffictypediagnostic: MN2PR12MB3229:
x-microsoft-antispam-prvs: <MN2PR12MB3229143205A499B24EE481A3A2C70@MN2PR12MB3229.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(199004)(189003)(2501003)(478600001)(5640700003)(2351001)(25786009)(9686003)(55016002)(14454004)(6436002)(6916009)(53936002)(76116006)(52536014)(66066001)(224303003)(26005)(66476007)(476003)(86362001)(66556008)(64756008)(66446008)(66946007)(5660300002)(102836004)(2906002)(7736002)(8936002)(33656002)(81156014)(81166006)(316002)(4326008)(71200400001)(71190400001)(305945005)(6116002)(256004)(3846002)(68736007)(6506007)(558084003)(54906003)(7696005)(74316002)(186003)(99286004)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3229;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EctMpvGZsP7mvT5eTu+o6moMyMphT55DIjQmNB+t3wHTwdlKfF4gLovlbeVt91r2QQUpNlclzYvHhxMFyEpcFrRbhT2p0XSQ5I7wAmEVSFrvqh8i7TE4XdbD5ElzoPTNU1BrcBEjereK8ukTO5z+KZDRqKvlpfTjhz4A5BGEfuRDMlVCHkzhjChk1+uyKSQpadFmlaCDWqjujfiaS4fTAJuYw4TikZnXGkP5Voql3CRqbgI78cOD8LBeFlo745IgMhlrl/XQVzinjFbLLXXdEnXToJVGEvm/g/fTXEREVGKf7T+qE033KJ5ij9mFl4PUn2zBPDrs6OsS//FgD5UpbUoWFzqynvDr5UvsR2L/d9EZ/ShwkXKC666y5tWLpWSHIq+ZffEZv/NgFpw2hpP/ANRUNdUaKfhxqvF1Em/twCA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c61549-7713-40f0-0bb0-08d70f50c3b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 09:33:05.0599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3229
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzY6U6SmM17+Y+M/EqD3amL0IeLDHlAfKAjz/V8H2FU=;
 b=Z69YrcaUn7wN3G0BcY0YBc3B8AxLL77yNBEIqCF15VM4LEdlQxuthXz+DwjWW9Mz2Vn60Xx9+L5LjLfbIzUAhecBk9vlqCtZg17+/oIn+KF6h76IPz8Lm2Z4sV5WPLeiobZLeoAOY/q9hrz2WAP15rE5/bOAqRT3rBZ7+eunSZc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2FuZywgS2V2aW4oWWFuZykg5bCG5pKk5Zue6YKu5Lu24oCcW1BBVENIIHYyXSBkcm0vYW1kL3Bv
d2VycGxheTogYWRkIGhlbHBlciBvZiBzbXVfY2xrX2RwbV9pc19lbmFibGVkIGZvciBzbXXigJ3j
gIIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
