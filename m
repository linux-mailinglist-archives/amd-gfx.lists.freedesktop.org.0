Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4FA33336C
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Mar 2021 03:59:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B4C6E1B6;
	Wed, 10 Mar 2021 02:59:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1CE6E1B6
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Mar 2021 02:59:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLH2vlxkBYyPbQjqqFsz3G9PM1cF1I1topGfDkiqKKhwwb6zbs7NMKtNTftNrQzE4GI9slZ+rCzPPNiKMhNdy7SWXOnBqQsEkCW+ntQwYm8FFxaTjG0LM0t4J2ts+dEX3Vs1g8kFjn4Voq/MSN3AbrhRmhA+vt4uF+Pl4Ie7D6GU2I9lnjK9AyssvTBMhhFKyaIZtgwX0smwFSJx61lrI+AbOKB+Bba2VrE54KTiv4mJbsQ625H9UC9zA4AqvZCqDPQWQXHXseGvIrjh1KWzETwo+U69jvvtRVf0wv7wmSfmr7k3b+BqEvSEG1VKqTil0fycsnEXuXw/cTOrQlhf3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGLw4SIuw+KZlnsWeiXWEI7+PLJNMJL9sp1aCPPJLBM=;
 b=gPZA8s9M308UQ6fhZ/Z4IB0xHDDn3y0+L4Oa+OCNRdTwsQrMNiX0I2awIE11HFeHzMD7TZjJh3ZguSgAPq/51dt6X58/lBCMT0lk1XeM83mGBwIlXT559zNDEo7y+zLgFws5WxuC4fHl0wna5ogKFDP43JTQgKObAacDIY1HfY/msBc+rpfQmOIcnTN74FJUW0gU8daYSkDsq31yD7ty8bQ9A/dmS3xAC4Bc/amghdMOXf4fDmnZVGb8N7gpLiiDtE/7oa02+LVo+28VXrNNdKv7G3GexTnhD77dhkxTYSPWkjwNvsfdRtipEP3m0l+OSH5GEiJj9FGRyNPxt/7mAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGLw4SIuw+KZlnsWeiXWEI7+PLJNMJL9sp1aCPPJLBM=;
 b=U8TcTTCuytPIg8F98c7uXb/4M2HFm4MAwVWswvKXCGxZypnYFRLWkK7U8FUZiM9D09c1sQWfUhT2OYerOqmG6fEQKeBK1dkGPwYorMGMohk6DtRpquTJEDgM3w51aF5HRo2hF6uHRaYfeyi8KdryJIYabb7FCGQvWi3dGDw9ljk=
Received: from DM5PR12MB2533.namprd12.prod.outlook.com (2603:10b6:4:b0::10) by
 DM6PR12MB4282.namprd12.prod.outlook.com (2603:10b6:5:223::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17; Wed, 10 Mar 2021 02:59:38 +0000
Received: from DM5PR12MB2533.namprd12.prod.outlook.com
 ([fe80::9858:1263:9afa:4401]) by DM5PR12MB2533.namprd12.prod.outlook.com
 ([fe80::9858:1263:9afa:4401%7]) with mapi id 15.20.3890.039; Wed, 10 Mar 2021
 02:59:38 +0000
From: "Li, Dennis" <Dennis.Li@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: capture invalid hardware access v2
Thread-Topic: [PATCH] drm/amdgpu: capture invalid hardware access v2
Thread-Index: AQHXFEXRkluk8WFe50m+ImC+FgD6oap61h9ggADIt4CAAD6FgIAAEpuAgAAK7ACAAIyXIA==
Date: Wed, 10 Mar 2021 02:59:38 +0000
Message-ID: <DM5PR12MB2533F9EF35F1241731ECAA87ED919@DM5PR12MB2533.namprd12.prod.outlook.com>
References: <20210308180649.2117-1-christian.koenig@amd.com>
 <SN1PR12MB2544244642707C3EA1E27026ED929@SN1PR12MB2544.namprd12.prod.outlook.com>
 <91af0abc-ddde-9799-dab1-71d6eae7b765@gmail.com>
 <a69407d2-7961-f46b-9b4f-2378711b941d@amd.com>
 <632c9fbf-a7b4-7899-f708-edca00c73991@gmail.com>
 <b82c46da-50d4-3c86-f131-d70d6cee2445@amd.com>
In-Reply-To: <b82c46da-50d4-3c86-f131-d70d6cee2445@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=f4349f63-2a06-4dd0-adcd-81e1c3bc858a;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Use Only - Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-03-10T02:49:37Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6e87d8fc-b69e-47b5-3866-08d8e3708b5d
x-ms-traffictypediagnostic: DM6PR12MB4282:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB42826B1D24C14A7048D9B058ED919@DM6PR12MB4282.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TT1W46Ba1I1AXIiUMD6KEqYezavbDLnA1ELY2FWWsNrKpYZ4OTgmUQk5oZF3ghIxSkDwkGpn+crbjAuz+Ym4Tw6OaH0YvzAj86xWVjQqzKw5w1Q5bpJjVMeBtBT6YwkjhN5c7uGOj6PaxVY4zUJXmfLUA5v9FmE7IX6bXlhv12K+K5Hi7Pf+7rnlaBr4ftmjhf291YXUFaXVtCqvPWghHDvbUFs1eDzjCCwmG0EnfNpeMxbxcwG/JsoUtM6pZ37L79LNLVRWDi1JCAucFp5ykh0D0GZSR+dipOLIqYD2xRM1jyPZ3nXsaDB2bdA+H3dOvciFyUUZ1b8/QKxIQcZVSeXAb/WHcdBkWDDGYq/+U81QEylgxbY7u43W2W82arKnhnLZgN7l9QSHv8CuQrendm3d+72nGJevwpCPyNlH1OjzkzyC+dyiYTbWHOAPTnl2jvm8+tDNbF0oGfEe6fRvuPrXYVIFxQ5cliCRQ9PGxN2q5qGbVi2yc7nZb5uhqr/OaTQGlI4oICmeSVS4/gCc5A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2533.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(9686003)(110136005)(5660300002)(66556008)(53546011)(478600001)(66446008)(64756008)(52536014)(186003)(6506007)(55016002)(66574015)(8936002)(8676002)(76116006)(86362001)(71200400001)(2906002)(316002)(26005)(33656002)(66946007)(7696005)(83380400001)(66476007)(30864003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?cExLZ2UzajY1bDBwWVpXSmZoejVyamJYVHo1UVhRRlhKTXNVMEdzRXczQ0V3?=
 =?utf-8?B?aEJZQy9kbHl3VEZyUTd0SGFpV0syVlZ3RE5sM3RRY2V2Zk90T2ppbTRIYXRS?=
 =?utf-8?B?eE5CSTVhVWlLVXQrYWNPM2F1QXFDNXptTWJsTWsrVk5RQ08xdnZpSXZkMWVv?=
 =?utf-8?B?b1R0eC84aDU2YjdIYTRDZ2VXOHBUVEdpWFlqVXZQeGdjK215WE8wRDJXVFZU?=
 =?utf-8?B?eUFsRFpwWDlVc2hjTm5idjZzajNuajFFQkdEQXJPUGxCekFwemhza2ZHVjVQ?=
 =?utf-8?B?Wit6NFlZcVo4TU1scDNKZFhERU5zanR4VXBzQmdSMHd5Z0J4b3RTcGE3WlJY?=
 =?utf-8?B?MlZmcktKbDZVU1VLNURXanVjaTFVOVZTSU1xTUZpeFNiQXdhQTZEQWhNcW12?=
 =?utf-8?B?Tk9YSmpSR2tqZWFwSUdiNXhDWG9rUGJXajZUWVZLMGQvT3lrQXdhWmJ1L2R4?=
 =?utf-8?B?d1ZMSHlDTHB6R1RrR3NodEUvS0hVcUVHbVNoWk5WNXM1ZXJqeHhmT2NZTmNz?=
 =?utf-8?B?WGpqK3dFYVVNdjdvWEsyQkZYZHpIT2QrSXlFSTJUd3phek40dzRnaTdvbXpZ?=
 =?utf-8?B?eDJkemk1TzRLRjVjZVlGN2tHT0puVVQ2UFFaNnpsSFptVjYxL3Y5VUNsS3Fl?=
 =?utf-8?B?QTdCVlpMV0R2Uk5KSk9HbytTMEx5UWdjWXRGUkNITlRLTTJFN0pWRjdaelNI?=
 =?utf-8?B?cTlub1RvaHpzaUd4TGRlRXJjZ3dwMW5yNVVqVzJFelg0SkJqL2tEV0UwVTZk?=
 =?utf-8?B?clhneDBiOEkrQjA4YmlQcFRTNE1iMzVLODByd2hEcjhIK1hxdTNqL2FuVk9C?=
 =?utf-8?B?WkpBSkdUb1U0QURBallQNGFPdjdsUk45bmN3M1B0ZkZ3aml5NVJhaTcvRnR0?=
 =?utf-8?B?elUxUWE2N0VMTDk1UFZFaEdQYUJBWW45bE52eW5YOVdXTUZ0N2pGTGJJVTNI?=
 =?utf-8?B?Si9nN1lFL0FsSTludHNkZ3Rra2krSzh3a2h6anlRUk1HUysreTVUQ05zM2RZ?=
 =?utf-8?B?YXl4VHBMcU9qY1U2eklJVXJsa1BrZmJqb2N4SmMxTDd0VkgyVDJJVTlhTGY1?=
 =?utf-8?B?bW80Zm03Sis3VmtOREM2WTRpTDZ0eGtJUTdlV2Z0VUhpM1ZXVElrM3luZE03?=
 =?utf-8?B?eTNxZ1l6Y0RPVnVVVVY5LzAvaWw2UTV0YUZDUVJjcFMxZlY1eWhYYmFkTjFo?=
 =?utf-8?B?MG1ZS0VHNkR0RUZXYzdyQXlCdFNBbnJmR1k3alN5Sm52TENjRGw5SmdQTFZY?=
 =?utf-8?B?OGhEcFZ2cklNcGtTY0I4eXRtWC9MN1ZQN3c4cTB3RTlxdGdZaStUZndKVHRP?=
 =?utf-8?B?VVNRanpXU2E2aEZaczNVZzRIZmZQWGgwNDhxaVIwUW1DM3VpSVNyOEtrUU43?=
 =?utf-8?B?dnZaQ1J4eHlxbDE0RTdxeldxckFHSzVtUmFxYnFpSTBmY2ZRUDdEOFY0UThZ?=
 =?utf-8?B?QWFlSHpMZXpaYmwwdVEwbVBpcm9LN0dnbDZ6d3JSSm5jV3R1UmhwTnZjWmVE?=
 =?utf-8?B?NXJqZHhxWHNXZUc0ck0yZUhiK1E0QkpDUzZSaC9Xa1MxVGhMb0NvOUR0OGVj?=
 =?utf-8?B?VWFZRlhNejh6VGFjZEJqTHFJSi8xcHVpd21DdEdaM2hmeUdLL1VSZUJTNzd4?=
 =?utf-8?B?aTA4R0ppUlhzUHc1UmZrdUJsekUzYnU0OVhDV0dZcjNXN2UyNkJZazk4WEFL?=
 =?utf-8?B?eHM0UGt6VXEvUG94cWtpMWdUczh6MUlCdFN6eWlvQ01KUkYzTVRCdEJsZTdI?=
 =?utf-8?Q?9pzmy2F39hYgIY0amUhaZYiAhQb2BdthjcgKdYf?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2533.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e87d8fc-b69e-47b5-3866-08d8e3708b5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2021 02:59:38.5750 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RHyBIe2YrdO35ma2C+V1IM6x2lyaMcE23x7SE9FEKSELa8n7aZ4ZGQNrFhnUwKeE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4282
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KDQpI
aSwgQW5kcmV5LA0KPj4+IElzIHRoZSBwcm9ibGVtIGhlcmUgdGhhdCBIVyBpcyBzdXNwZW5kZWQg
d2hpbGUgc29tZSBvdGhlciB0aHJlYWRzIHRoYXQgcmVseSBvbiB0aGUgcmVhZCBzaWRlIGxvY2sg
c3RpbGwgYWNjZXNzIEhXID8gTW9zdGx5IHdoYXQgSSBhbSB0aGlua2luZyBhYm91dCBhcmUgSU9D
VGxzIC0gd2UgY2FuJ3QgJ3dhaXQgZm9yIHRoZW0gdG8gY29tcGxldGUnIGJ1dCB0aGV5IG1pZ2h0
IGJlIGFjY2Vzc2luZyBIVyB3aGVuIHdlIHN0YXJ0IHN1c3BlbmQuDQpJbiByZWFkIHNpZGUsIHdo
ZW4gdGhlIHJlYWRlciBoZWxkIHRoZSByZWFkIGxvY2ssIGl0IHdpbGwgYWxzbyBjaGVjayB3aGV0
aGVyIGFkZXYtPmluX2dwdV9yZXNldCBpcyAxLCBpZiBzbywgaXQgd2lsbCByZWxlYXNlIHJlYWQg
Y2xvY2sgYW5kIGlzIHdhaXRpbmcgZm9yIHJlY292ZXJ5IGZpbmlzaCBldmVudC4NCg0KQmVzdCBS
ZWdhcmRzDQpEZW5uaXMgTGkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEdy
b2R6b3Zza3ksIEFuZHJleSA8QW5kcmV5Lkdyb2R6b3Zza3lAYW1kLmNvbT4NClNlbnQ6IFdlZG5l
c2RheSwgTWFyY2ggMTAsIDIwMjEgMjoyNiBBTQ0KVG86IENocmlzdGlhbiBLw7ZuaWcgPGNrb2Vu
aWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPjsgTGksIERlbm5pcyA8RGVubmlzLkxpQGFtZC5j
b20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KU3ViamVjdDogUmU6IFtQQVRDSF0g
ZHJtL2FtZGdwdTogY2FwdHVyZSBpbnZhbGlkIGhhcmR3YXJlIGFjY2VzcyB2Mg0KDQpPbiAyMDIx
LTAzLTA5IDEyOjQ3IHAubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+IE5vIGl0IHdvbid0
LiBBY2Nlc3NpbmcgdGhlIGhhcmR3YXJlIHdpdGhvdXQgdGhlIGxvY2sgaXMgb2sgYXMgbG9uZyBh
cw0KPiB0aGUgd3JpdGUgc2lkZSBpc24ndCB0YWtlbi4NCg0KT2gsIGZvcmdvdCBhYm91dCB0aGUg
dHJ5bG9jayBwYXJ0LCBzb3JyeS4uLg0KDQo+DQo+IEJ1dCB0aGF0IGFwcHJvYWNoIGlzIGlsbGVn
YWwgYW55d2F5IGJlY2F1c2Ugd2Ugc3VzcGVuZCB0aGUgaGFyZHdhcmUNCj4gd2l0aG91dCBwcm9w
ZXIgcHJvdGVjdGlvbiBmcm9tIGNvbmN1cnJlbnQgYWNjZXNzLg0KDQpGb3IgbXkgdW5kZXJzdGFu
ZGluZyBhbmQgZnJvbSBsb29raW5nIGFnYWluIGF0IGhpcyBzdGVwcyByZWxhdGVkIHRvIHRoaXMN
Cg0KU3RlcCAwOiBhdG9taWNfY21weGNoZygmYWRldi0+aW5fZ3B1X3Jlc2V0LCAwLCAxKSAtIFtB
R10gcHJvdGVjdHMgZnJvbSBvdGhlciBURFIgdGhyZWFkcw0KDQpTdGVwIDE6IGNhbmNlbCBhbGwg
ZGVsYXkgd29ya3MsIHN0b3AgZHJtIHNjaGVkdWxlLCBjb21wbGV0ZSBhbGwgdW5yZWNlaXZlZCBm
ZW5jZXMgYW5kIHNvIG9uLiBDYWxsIGFtZGdwdV9kZXZpY2VfcHJlX2FzaWNfcmVzZXQuLi4gZS50
LmMNCi0gW0FHXSB0aGlzIGlzIHRoZSBIVyBzdXNwZW5kIHBhcnQNCg0KU3RlcCAyOiBjYWxsIGRv
d25fd3JpdGUoJmFkZXYtPnJlc2V0X3NlbSkgdG8gaG9sZCB3cml0ZSBsb2NrLCB3aGljaCB3aWxs
IGJsb2NrIHJlY292ZXJ5IHRocmVhZCB1bnRpbCBvdGhlciB0aHJlYWRzIHJlbGVhc2UgcmVhZCBs
b2Nrcy4NCg0KSXMgdGhlIHByb2JsZW0gaGVyZSB0aGF0IEhXIGlzIHN1c3BlbmRlZCB3aGlsZSBz
b21lIG90aGVyIHRocmVhZHMgdGhhdCByZWx5IG9uIHRoZSByZWFkIHNpZGUgbG9jayBzdGlsbCBh
Y2Nlc3MgSFcgPyBNb3N0bHkgd2hhdCBJIGFtIHRoaW5raW5nIGFib3V0IGFyZSBJT0NUbHMgLSB3
ZSBjYW4ndCAnd2FpdCBmb3IgdGhlbSB0byBjb21wbGV0ZScgYnV0IHRoZXkgbWlnaHQgYmUgYWNj
ZXNzaW5nIEhXIHdoZW4gd2Ugc3RhcnQgc3VzcGVuZC4NCg0KQW5kcmV5DQoNCg0KPg0KPiBDaHJp
c3RpYW4uDQo+DQo+IEFtIDA5LjAzLjIxIHVtIDE3OjQwIHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zz
a3k6DQo+PiBCZWNhdXNlIGhlIHRha2VzIHRoZSB3cml0ZSBzaWRlIGxvY2sgcG9zdCBhbWRncHVf
cHJlX2FzaWNfcmVzZXQgLQ0KPj4gd2hlcmUgSFcgc3VzcGVuZCBzZXF1ZW5jZSBoYXBwZW5zICh0
b3VjaGluZyByZWdpc3RlcnMpIC0gc28gaSB0aGluaw0KPj4gaXQgd2lsbCBhc3NlcnQuDQo+Pg0K
Pj4gQW5kcmV5DQo+Pg0KPj4gT24gMjAyMS0wMy0wOSA3OjU2IGEubS4sIENocmlzdGlhbiBLw7Zu
aWcgd3JvdGU6DQo+Pj4gSGkgRGVubmlzLA0KPj4+DQo+Pj4gd2h5IGRvIHlvdSB0aGluayB0aGF0
IHRoaXMgd2lsbCBhbHdheXMgYXNzZXJ0IGluIHJlc2V0IHRocmVhZD8NCj4+Pg0KPj4+IEluIHRo
ZSByZXNldCB0aHJlYWQgd2hpbGUgd2UgYXJlIGhvbGRpbmcgdGhlIHJlc2V0IGxvY2sgd3JpdGUg
c2lkZQ0KPj4+IGxvY2tkZXBfYXNzZXJ0X2hlbGQoKSBzaG91bGQgYmUgc2F0aXNmaWVkIGFuZCBu
b3QgY2F1c2UgYW55IHNwbGF0IGluDQo+Pj4gdGhlIHN5c3RlbSBsb2cuDQo+Pj4NCj4+PiBSZWdh
cmRzLA0KPj4+IENocmlzdGlhbi4NCj4+Pg0KPj4+IEFtIDA5LjAzLjIxIHVtIDAzOjAzIHNjaHJp
ZWIgTGksIERlbm5pczoNCj4+Pj4gW0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERp
c3RyaWJ1dGlvbiBPbmx5XQ0KPj4+Pg0KPj4+PiBIaSwgQ2hyaXN0aWFuLA0KPj4+PiAgICAgICAg
IGFtZGdwdV9kZXZpY2Vfc2tpcF9od19hY2Nlc3Mgd2lsbCBhbHdheXMgYXNzZXJ0IGluIHJlc2V0
DQo+Pj4+IHRocmVhZCwgd2hpY2ggc2VlbXMgbm90IGEgZ29vZCBpZGVhLg0KPj4+Pg0KPj4+PiBC
ZXN0IFJlZ2FyZHMNCj4+Pj4gRGVubmlzIExpDQo+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+Pj4+IEZyb206IENocmlzdGlhbiBLw7ZuaWcgPGNrb2VuaWcubGVpY2h0enVtZXJrZW5A
Z21haWwuY29tPg0KPj4+PiBTZW50OiBUdWVzZGF5LCBNYXJjaCA5LCAyMDIxIDI6MDcgQU0NCj4+
Pj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Pj4+IENjOiBHcm9kem92c2t5
LCBBbmRyZXkgPEFuZHJleS5Hcm9kem92c2t5QGFtZC5jb20+OyBMaSwgRGVubmlzDQo+Pj4+IDxE
ZW5uaXMuTGlAYW1kLmNvbT4NCj4+Pj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiBjYXB0
dXJlIGludmFsaWQgaGFyZHdhcmUgYWNjZXNzIHYyDQo+Pj4+DQo+Pj4+IEZyb206IERlbm5pcyBM
aSA8RGVubmlzLkxpQGFtZC5jb20+DQo+Pj4+DQo+Pj4+IFdoZW4gcmVjb3ZlcnkgdGhyZWFkIGhh
cyBiZWd1biBHUFUgcmVzZXQsIHRoZXJlIHNob3VsZCBiZSBub3Qgb3RoZXINCj4+Pj4gdGhyZWFk
cyB0byBhY2Nlc3MgaGFyZHdhcmUsIG90aGVyd2lzZSBzeXN0ZW0gcmFuZG9tbHkgaGFuZy4NCj4+
Pj4NCj4+Pj4gdjIgKGNoayk6IHJld3JpdHRlbiBmcm9tIHNjcmF0Y2gsIHVzZSB0cnlsb2NrIGFu
ZCBsb2NrZGVwIGluc3RlYWQNCj4+Pj4gb2YNCj4+Pj4gICAgaGFuZCB3aXJpbmcgdGhlIGxvZ2lj
Lg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBEZW5uaXMgTGkgPERlbm5pcy5MaUBhbWQuY29t
Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+DQo+Pj4+IC0tLQ0KPj4+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZXZpY2UuYyB8IDc0DQo+Pj4+ICsrKysrKysrKysrKysrKysrLS0tLS0NCj4+Pj4gICAx
IGZpbGUgY2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pDQo+Pj4+DQo+
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNl
LmMNCj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCj4+
Pj4gaW5kZXggZTI0N2MzYTJlYzA4Li5jOTkwYWY2YTQzY2EgMTAwNjQ0DQo+Pj4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KPj4+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCj4+Pj4gQEAgLTMyNiw2ICsz
MjYsMzQgQEAgdm9pZCBhbWRncHVfZGV2aWNlX3ZyYW1fYWNjZXNzKHN0cnVjdA0KPj4+PiBhbWRn
cHVfZGV2aWNlICphZGV2LCBsb2ZmX3QgcG9zLA0KPj4+PiAgIC8qDQo+Pj4+ICAgICogcmVnaXN0
ZXIgYWNjZXNzIGhlbHBlciBmdW5jdGlvbnMuDQo+Pj4+ICAgICovDQo+Pj4+ICsNCj4+Pj4gKy8q
IENoZWNrIGlmIGh3IGFjY2VzcyBzaG91bGQgYmUgc2tpcHBlZCBiZWNhdXNlIG9mIGhvdHBsdWcg
b3INCj4+Pj4gK2RldmljZSBlcnJvciAqLyBzdGF0aWMgYm9vbCBhbWRncHVfZGV2aWNlX3NraXBf
aHdfYWNjZXNzKHN0cnVjdA0KPj4+PiArYW1kZ3B1X2RldmljZQ0KPj4+PiArKmFkZXYpIHsNCj4+
Pj4gK2lmIChhZGV2LT5pbl9wY2lfZXJyX3JlY292ZXJ5KQ0KPj4+PiArcmV0dXJuIHRydWU7DQo+
Pj4+ICsNCj4+Pj4gKyNpZmRlZiBDT05GSUdfTE9DS0RFUA0KPj4+PiArLyoNCj4+Pj4gKyAqIFRo
aXMgaXMgYSBiaXQgY29tcGxpY2F0ZWQgdG8gdW5kZXJzdGFuZCwgc28gd29ydGggYSBjb21tZW50
Lg0KPj4+PiBXaGF0IHdlIGFzc2VydA0KPj4+PiArICogaGVyZSBpcyB0aGF0IHRoZSBHUFUgcmVz
ZXQgaXMgbm90IHJ1bm5pbmcgb24gYW5vdGhlciB0aHJlYWQgaW4NCj4+Pj4gcGFyYWxsZWwuDQo+
Pj4+ICsgKg0KPj4+PiArICogRm9yIHRoaXMgd2UgdHJ5bG9jayB0aGUgcmVhZCBzaWRlIG9mIHRo
ZSByZXNldCBzZW1hcGhvcmUsIGlmDQo+Pj4+IHRoYXQgc3VjY2VlZHMNCj4+Pj4gKyAqIHdlIGtu
b3cgdGhhdCB0aGUgcmVzZXQgaXMgbm90IHJ1bm5pbmcgaW4gcGFyYWxlbGwuDQo+Pj4+ICsgKg0K
Pj4+PiArICogSWYgdGhlIHRyeWxvY2sgZmFpbHMgd2UgYXNzZXJ0IHRoYXQgd2UgYXJlIGVpdGhl
ciBhbHJlYWR5DQo+Pj4+IGhvbGRpbmcgdGhlIHJlYWQNCj4+Pj4gKyAqIHNpZGUgb2YgdGhlIGxv
Y2sgb3IgYXJlIHRoZSByZXNldCB0aHJlYWQgaXRzZWxmIGFuZCBob2xkIHRoZQ0KPj4+PiB3cml0
ZSBzaWRlIG9mDQo+Pj4+ICsgKiB0aGUgbG9jay4NCj4+Pj4gKyAqLw0KPj4+PiAraWYgKGRvd25f
cmVhZF90cnlsb2NrKCZhZGV2LT5yZXNldF9zZW0pKQ0KPj4+PiArdXBfcmVhZCgmYWRldi0+cmVz
ZXRfc2VtKTsNCj4+Pj4gK2Vsc2UNCj4+Pj4gK2xvY2tkZXBfYXNzZXJ0X2hlbGQoJmFkZXYtPnJl
c2V0X3NlbSk7DQo+Pj4+ICsjZW5kaWYNCj4+Pj4gKw0KPj4+PiArcmV0dXJuIGZhbHNlOw0KPj4+
PiArfQ0KPj4+PiArDQo+Pj4+ICAgLyoqDQo+Pj4+ICAgICogYW1kZ3B1X2RldmljZV9ycmVnIC0g
cmVhZCBhIG1lbW9yeSBtYXBwZWQgSU8gb3IgaW5kaXJlY3QNCj4+Pj4gcmVnaXN0ZXINCj4+Pj4g
ICAgKg0KPj4+PiBAQCAtMzQwLDcgKzM2OCw3IEBAIHVpbnQzMl90IGFtZGdwdV9kZXZpY2VfcnJl
ZyhzdHJ1Y3QNCj4+Pj4gYW1kZ3B1X2RldmljZSAqYWRldiwgIHsNCj4+Pj4gICB1aW50MzJfdCBy
ZXQ7DQo+Pj4+DQo+Pj4+IC1pZiAoYWRldi0+aW5fcGNpX2Vycl9yZWNvdmVyeSkNCj4+Pj4gK2lm
IChhbWRncHVfZGV2aWNlX3NraXBfaHdfYWNjZXNzKGFkZXYpKQ0KPj4+PiAgIHJldHVybiAwOw0K
Pj4+Pg0KPj4+PiAgIGlmICgocmVnICogNCkgPCBhZGV2LT5ybW1pb19zaXplKSB7IEBAIC0zNzcs
NyArNDA1LDcgQEAgdWludDMyX3QNCj4+Pj4gYW1kZ3B1X2RldmljZV9ycmVnKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LA0KPj4+PiAgICAqLw0KPj4+PiAgIHVpbnQ4X3QgYW1kZ3B1X21tX3Jy
ZWc4KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50MzJfdA0KPj4+PiBvZmZzZXQpICB7
DQo+Pj4+IC1pZiAoYWRldi0+aW5fcGNpX2Vycl9yZWNvdmVyeSkNCj4+Pj4gK2lmIChhbWRncHVf
ZGV2aWNlX3NraXBfaHdfYWNjZXNzKGFkZXYpKQ0KPj4+PiAgIHJldHVybiAwOw0KPj4+Pg0KPj4+
PiAgIGlmIChvZmZzZXQgPCBhZGV2LT5ybW1pb19zaXplKQ0KPj4+PiBAQCAtNDAyLDcgKzQzMCw3
IEBAIHVpbnQ4X3QgYW1kZ3B1X21tX3JyZWc4KHN0cnVjdCBhbWRncHVfZGV2aWNlDQo+Pj4+ICph
ZGV2LCB1aW50MzJfdCBvZmZzZXQpDQo+Pj4+ICAgICovDQo+Pj4+ICAgdm9pZCBhbWRncHVfbW1f
d3JlZzgoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IG9mZnNldCwNCj4+Pj4g
dWludDhfdCB2YWx1ZSkgIHsgLWlmIChhZGV2LT5pbl9wY2lfZXJyX3JlY292ZXJ5KQ0KPj4+PiAr
aWYgKGFtZGdwdV9kZXZpY2Vfc2tpcF9od19hY2Nlc3MoYWRldikpDQo+Pj4+ICAgcmV0dXJuOw0K
Pj4+Pg0KPj4+PiAgIGlmIChvZmZzZXQgPCBhZGV2LT5ybW1pb19zaXplKQ0KPj4+PiBAQCAtNDI1
LDcgKzQ1Myw3IEBAIHZvaWQgYW1kZ3B1X2RldmljZV93cmVnKHN0cnVjdCBhbWRncHVfZGV2aWNl
DQo+Pj4+ICphZGV2LA0KPj4+PiAgIHVpbnQzMl90IHJlZywgdWludDMyX3QgdiwNCj4+Pj4gICB1
aW50MzJfdCBhY2NfZmxhZ3MpDQo+Pj4+ICAgew0KPj4+PiAtaWYgKGFkZXYtPmluX3BjaV9lcnJf
cmVjb3ZlcnkpDQo+Pj4+ICtpZiAoYW1kZ3B1X2RldmljZV9za2lwX2h3X2FjY2VzcyhhZGV2KSkN
Cj4+Pj4gICByZXR1cm47DQo+Pj4+DQo+Pj4+ICAgaWYgKChyZWcgKiA0KSA8IGFkZXYtPnJtbWlv
X3NpemUpIHsgQEAgLTQ1Miw3ICs0ODAsNyBAQCB2b2lkDQo+Pj4+IGFtZGdwdV9kZXZpY2Vfd3Jl
ZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgIHZvaWQNCj4+Pj4gYW1kZ3B1X21tX3dyZWdf
bW1pb19ybGMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+Pj4+ICAgICAgICB1aW50MzJf
dCByZWcsIHVpbnQzMl90IHYpDQo+Pj4+ICAgew0KPj4+PiAtaWYgKGFkZXYtPmluX3BjaV9lcnJf
cmVjb3ZlcnkpDQo+Pj4+ICtpZiAoYW1kZ3B1X2RldmljZV9za2lwX2h3X2FjY2VzcyhhZGV2KSkN
Cj4+Pj4gICByZXR1cm47DQo+Pj4+DQo+Pj4+ICAgaWYgKGFtZGdwdV9zcmlvdl9mdWxsYWNjZXNz
KGFkZXYpICYmIEBAIC00NzUsNyArNTAzLDcgQEAgdm9pZA0KPj4+PiBhbWRncHVfbW1fd3JlZ19t
bWlvX3JsYyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4+Pj4gICAgKi8NCj4+Pj4gICB1
MzIgYW1kZ3B1X2lvX3JyZWcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHUzMiByZWcpICB7
IC1pZg0KPj4+PiAoYWRldi0+aW5fcGNpX2Vycl9yZWNvdmVyeSkNCj4+Pj4gK2lmIChhbWRncHVf
ZGV2aWNlX3NraXBfaHdfYWNjZXNzKGFkZXYpKQ0KPj4+PiAgIHJldHVybiAwOw0KPj4+Pg0KPj4+
PiAgIGlmICgocmVnICogNCkgPCBhZGV2LT5yaW9fbWVtX3NpemUpIEBAIC00OTcsNyArNTI1LDcg
QEAgdTMyDQo+Pj4+IGFtZGdwdV9pb19ycmVnKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0K
Pj4+PiB1MzIgcmVnKQ0KPj4+PiAgICAqLw0KPj4+PiAgIHZvaWQgYW1kZ3B1X2lvX3dyZWcoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHUzMiByZWcsIHUzMiB2KQ0KPj4+PiB7IC1pZiAoYWRl
di0+aW5fcGNpX2Vycl9yZWNvdmVyeSkNCj4+Pj4gK2lmIChhbWRncHVfZGV2aWNlX3NraXBfaHdf
YWNjZXNzKGFkZXYpKQ0KPj4+PiAgIHJldHVybjsNCj4+Pj4NCj4+Pj4gICBpZiAoKHJlZyAqIDQp
IDwgYWRldi0+cmlvX21lbV9zaXplKSBAQCAtNTE5LDcgKzU0Nyw3IEBAIHZvaWQNCj4+Pj4gYW1k
Z3B1X2lvX3dyZWcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+Pj4+IHUzMiByZWcsIHUz
MiB2KQ0KPj4+PiAgICAqLw0KPj4+PiAgIHUzMiBhbWRncHVfbW1fcmRvb3JiZWxsKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LCB1MzIgaW5kZXgpICB7DQo+Pj4+IC1pZiAoYWRldi0+aW5fcGNp
X2Vycl9yZWNvdmVyeSkNCj4+Pj4gK2lmIChhbWRncHVfZGV2aWNlX3NraXBfaHdfYWNjZXNzKGFk
ZXYpKQ0KPj4+PiAgIHJldHVybiAwOw0KPj4+Pg0KPj4+PiAgIGlmIChpbmRleCA8IGFkZXYtPmRv
b3JiZWxsLm51bV9kb29yYmVsbHMpIHsgQEAgLTU0Miw3ICs1NzAsNyBAQA0KPj4+PiB1MzIgYW1k
Z3B1X21tX3Jkb29yYmVsbChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdTMyIGluZGV4KQ0K
Pj4+PiAgICAqLw0KPj4+PiAgIHZvaWQgYW1kZ3B1X21tX3dkb29yYmVsbChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwgdTMyIGluZGV4LA0KPj4+PiB1MzIgdikgIHsNCj4+Pj4gLWlmIChhZGV2
LT5pbl9wY2lfZXJyX3JlY292ZXJ5KQ0KPj4+PiAraWYgKGFtZGdwdV9kZXZpY2Vfc2tpcF9od19h
Y2Nlc3MoYWRldikpDQo+Pj4+ICAgcmV0dXJuOw0KPj4+Pg0KPj4+PiAgIGlmIChpbmRleCA8IGFk
ZXYtPmRvb3JiZWxsLm51bV9kb29yYmVsbHMpIHsgQEAgLTU2Myw3ICs1OTEsNyBAQA0KPj4+PiB2
b2lkIGFtZGdwdV9tbV93ZG9vcmJlbGwoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHUzMiBp
bmRleCwgdTMyDQo+Pj4+IHYpDQo+Pj4+ICAgICovDQo+Pj4+ICAgdTY0IGFtZGdwdV9tbV9yZG9v
cmJlbGw2NChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdTMyIGluZGV4KQ0KPj4+PiB7IC1p
ZiAoYWRldi0+aW5fcGNpX2Vycl9yZWNvdmVyeSkNCj4+Pj4gK2lmIChhbWRncHVfZGV2aWNlX3Nr
aXBfaHdfYWNjZXNzKGFkZXYpKQ0KPj4+PiAgIHJldHVybiAwOw0KPj4+Pg0KPj4+PiAgIGlmIChp
bmRleCA8IGFkZXYtPmRvb3JiZWxsLm51bV9kb29yYmVsbHMpIHsgQEAgLTU4Niw3ICs2MTQsNyBA
QA0KPj4+PiB1NjQgYW1kZ3B1X21tX3Jkb29yYmVsbDY0KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LCB1MzIgaW5kZXgpDQo+Pj4+ICAgICovDQo+Pj4+ICAgdm9pZCBhbWRncHVfbW1fd2Rvb3Ji
ZWxsNjQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHUzMiBpbmRleCwNCj4+Pj4gdTY0IHYp
ICB7DQo+Pj4+IC1pZiAoYWRldi0+aW5fcGNpX2Vycl9yZWNvdmVyeSkNCj4+Pj4gK2lmIChhbWRn
cHVfZGV2aWNlX3NraXBfaHdfYWNjZXNzKGFkZXYpKQ0KPj4+PiAgIHJldHVybjsNCj4+Pj4NCj4+
Pj4gICBpZiAoaW5kZXggPCBhZGV2LT5kb29yYmVsbC5udW1fZG9vcmJlbGxzKSB7IEBAIC02MTAs
MTAgKzYzOCwxMyBAQA0KPj4+PiB1MzIgYW1kZ3B1X2RldmljZV9pbmRpcmVjdF9ycmVnKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LA0KPj4+PiAgIHUzMiBwY2llX2luZGV4LCB1MzIgcGNpZV9k
YXRhLA0KPj4+PiAgIHUzMiByZWdfYWRkcikNCj4+Pj4gICB7DQo+Pj4+IC11bnNpZ25lZCBsb25n
IGZsYWdzOw0KPj4+PiAtdTMyIHI7DQo+Pj4+ICAgdm9pZCBfX2lvbWVtICpwY2llX2luZGV4X29m
ZnNldDsNCj4+Pj4gICB2b2lkIF9faW9tZW0gKnBjaWVfZGF0YV9vZmZzZXQ7DQo+Pj4+ICt1bnNp
Z25lZCBsb25nIGZsYWdzOw0KPj4+PiArdTMyIHI7DQo+Pj4+ICsNCj4+Pj4gK2lmIChhbWRncHVf
ZGV2aWNlX3NraXBfaHdfYWNjZXNzKGFkZXYpKQ0KPj4+PiArcmV0dXJuIDA7DQo+Pj4+DQo+Pj4+
ICAgc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPnBjaWVfaWR4X2xvY2ssIGZsYWdzKTsNCj4+Pj4g
ICBwY2llX2luZGV4X29mZnNldCA9ICh2b2lkIF9faW9tZW0gKilhZGV2LT5ybW1pbyArIHBjaWVf
aW5kZXggKiA0Ow0KPj4+PiBAQCAtNjQxLDEwICs2NzIsMTMgQEAgdTY0IGFtZGdwdV9kZXZpY2Vf
aW5kaXJlY3RfcnJlZzY0KHN0cnVjdA0KPj4+PiBhbWRncHVfZGV2aWNlICphZGV2LA0KPj4+PiAg
ICAgdTMyIHBjaWVfaW5kZXgsIHUzMiBwY2llX2RhdGEsDQo+Pj4+ICAgICB1MzIgcmVnX2FkZHIp
DQo+Pj4+ICAgew0KPj4+PiAtdW5zaWduZWQgbG9uZyBmbGFnczsNCj4+Pj4gLXU2NCByOw0KPj4+
PiAgIHZvaWQgX19pb21lbSAqcGNpZV9pbmRleF9vZmZzZXQ7DQo+Pj4+ICAgdm9pZCBfX2lvbWVt
ICpwY2llX2RhdGFfb2Zmc2V0Ow0KPj4+PiArdW5zaWduZWQgbG9uZyBmbGFnczsNCj4+Pj4gK3U2
NCByOw0KPj4+PiArDQo+Pj4+ICtpZiAoYW1kZ3B1X2RldmljZV9za2lwX2h3X2FjY2VzcyhhZGV2
KSkNCj4+Pj4gK3JldHVybiAwOw0KPj4+Pg0KPj4+PiAgIHNwaW5fbG9ja19pcnFzYXZlKCZhZGV2
LT5wY2llX2lkeF9sb2NrLCBmbGFncyk7DQo+Pj4+ICAgcGNpZV9pbmRleF9vZmZzZXQgPSAodm9p
ZCBfX2lvbWVtICopYWRldi0+cm1taW8gKyBwY2llX2luZGV4ICogNDsNCj4+Pj4gQEAgLTY3Nyw5
ICs3MTEsMTIgQEAgdm9pZCBhbWRncHVfZGV2aWNlX2luZGlyZWN0X3dyZWcoc3RydWN0DQo+Pj4+
IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+Pj4+ICAgIHUzMiBwY2llX2luZGV4LCB1MzIgcGNpZV9k
YXRhLA0KPj4+PiAgICB1MzIgcmVnX2FkZHIsIHUzMiByZWdfZGF0YSkNCj4+Pj4gICB7DQo+Pj4+
IC11bnNpZ25lZCBsb25nIGZsYWdzOw0KPj4+PiAgIHZvaWQgX19pb21lbSAqcGNpZV9pbmRleF9v
ZmZzZXQ7DQo+Pj4+ICAgdm9pZCBfX2lvbWVtICpwY2llX2RhdGFfb2Zmc2V0Ow0KPj4+PiArdW5z
aWduZWQgbG9uZyBmbGFnczsNCj4+Pj4gKw0KPj4+PiAraWYgKGFtZGdwdV9kZXZpY2Vfc2tpcF9o
d19hY2Nlc3MoYWRldikpDQo+Pj4+ICtyZXR1cm47DQo+Pj4+DQo+Pj4+ICAgc3Bpbl9sb2NrX2ly
cXNhdmUoJmFkZXYtPnBjaWVfaWR4X2xvY2ssIGZsYWdzKTsNCj4+Pj4gICBwY2llX2luZGV4X29m
ZnNldCA9ICh2b2lkIF9faW9tZW0gKilhZGV2LT5ybW1pbyArIHBjaWVfaW5kZXggKiA0Ow0KPj4+
PiBAQCAtNzA2LDkgKzc0MywxMiBAQCB2b2lkIGFtZGdwdV9kZXZpY2VfaW5kaXJlY3Rfd3JlZzY0
KHN0cnVjdA0KPj4+PiBhbWRncHVfZGV2aWNlICphZGV2LA0KPj4+PiAgICAgIHUzMiBwY2llX2lu
ZGV4LCB1MzIgcGNpZV9kYXRhLA0KPj4+PiAgICAgIHUzMiByZWdfYWRkciwgdTY0IHJlZ19kYXRh
KQ0KPj4+PiAgIHsNCj4+Pj4gLXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+Pj4+ICAgdm9pZCBfX2lv
bWVtICpwY2llX2luZGV4X29mZnNldDsNCj4+Pj4gICB2b2lkIF9faW9tZW0gKnBjaWVfZGF0YV9v
ZmZzZXQ7DQo+Pj4+ICt1bnNpZ25lZCBsb25nIGZsYWdzOw0KPj4+PiArDQo+Pj4+ICtpZiAoYW1k
Z3B1X2RldmljZV9za2lwX2h3X2FjY2VzcyhhZGV2KSkNCj4+Pj4gK3JldHVybjsNCj4+Pj4NCj4+
Pj4gICBzcGluX2xvY2tfaXJxc2F2ZSgmYWRldi0+cGNpZV9pZHhfbG9jaywgZmxhZ3MpOw0KPj4+
PiAgIHBjaWVfaW5kZXhfb2Zmc2V0ID0gKHZvaWQgX19pb21lbSAqKWFkZXYtPnJtbWlvICsgcGNp
ZV9pbmRleCAqIDQ7DQo+Pj4+IC0tDQo+Pj4+IDIuMjUuMQ0KPj4+Pg0KPj4+DQo+DQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
