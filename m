Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B56548A5AF
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Jan 2022 03:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA0710E524;
	Tue, 11 Jan 2022 02:32:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2085.outbound.protection.outlook.com [40.107.96.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E93510E4FC
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Jan 2022 02:32:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dsko2xsB3AwPjxM6MWtnFe9O3horG8rNMa9XUIrGzPeXk/dr2/1VU1JPnPSF3GLVyH0NRhcuQhKD1KQjnHIWcgG/Tchr15eHUzuafKWmpJnfEPpHFrFjFVSAojYOVguhlAIYpCQTrgrorL5nv4ZaKuxDvAsLBFz9arAi5vQHtXHfwuz4Bv87oInXiMvZWIuL7Oap6SwoAfVF86uOK2Q0X8q2iHd7FjioO7N17ReBDT354vX3JI7djaHgClTEO7PlzrgQOmOOs4ATE8/T217U/4GJIRSkd4KUelOIWt7vsxkwK92felhgZ3A1OoVJM6AK2HqNxH6jgTReMnTokpZAWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZeTWHyPsmPem/JoyPrTpOJ46GGq5unWtBtOGhEfk7U=;
 b=d8Qz9UXGKKfNCKOhwlW1W1c+tUSibNwh83rKPNzlDuV4voIGLKHjNSux6zsVJNhRs8jsvAJCN7x03iZUnYhSlAXMECIbudkdA7cqe4tu1m+F71ksPsXZ3dIsLX2vYo3C16rPJ5RrTgDeYG6dsLnG6Tn6ouBTpINHkslTPwEuih2z7BW7/mhYJ2Z6IuCc6Hauzgc61kxwFDXMegBHlR7kfy8+PnVCnfMow7F2XDLMroYDESTnjsan4j9vrcbzII9TJnC93pktWjepHYcj1+x5cTBMq2lwVXyoz+wf2lvKuP9KO74NI4yUjR2tQ8OiL04X2/B13NRYiLurKqTjLdPRLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZeTWHyPsmPem/JoyPrTpOJ46GGq5unWtBtOGhEfk7U=;
 b=YNQdB4f8kOI8U+EHZvhlceTCMSOYtjIQSg9BI3PL4FS5eFZGKcLcJZTHmnaWQO0B4pusgfYgAqepFBdm5GGaZlL/bZM7UMLInccXUjY3z4QqD54g4aIK9Qg8ucgP7sZt5bbsj10FgxhN6/bdatNpdQD6T7VGz859fCfmStYTSi4=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM5PR12MB4677.namprd12.prod.outlook.com (2603:10b6:4:a4::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.9; Tue, 11 Jan 2022 02:32:54 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::a894:300e:5c16:5639]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::a894:300e:5c16:5639%6]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 02:32:54 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Lazar, Lijo" <Lijo.Lazar@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/pm: correct the checks for fan attributes support
Thread-Topic: [PATCH] drm/amd/pm: correct the checks for fan attributes support
Thread-Index: AQHYBedxL0Me/RnF70i3oeXJXOmBOKxb3aaAgAADTzCAAAwIgIABKWtg
Date: Tue, 11 Jan 2022 02:32:54 +0000
Message-ID: <DM6PR12MB2619A6C0FEE5C915B410E01EE4519@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20220110060042.3159997-1-evan.quan@amd.com>
 <1a71e156-5e04-6d49-53c2-c8ec83e2ce47@amd.com>
 <DM6PR12MB2619C547B8EF3BAA36534AA5E4509@DM6PR12MB2619.namprd12.prod.outlook.com>
 <bd2c0fd8-5cc9-fd6b-b091-538f943db640@amd.com>
In-Reply-To: <bd2c0fd8-5cc9-fd6b-b091-538f943db640@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-01-11T02:32:50Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=8ed83b4e-ebb6-42cb-9f0c-8502f6da1db9;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df87e070-c07a-42ff-1521-08d9d4aaabe7
x-ms-traffictypediagnostic: DM5PR12MB4677:EE_
x-microsoft-antispam-prvs: <DM5PR12MB4677B1851D99EBDE3AD6CB97E4519@DM5PR12MB4677.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u5U8Fz6ZoFwsT18Pd+0CFmXP1V8lCCQvFV23KnV1mQQeLnwrJnGjBDrzQhk8Ju5GgVGQbnT04t9O14jk3TR8Dk0oaEfFiwHbvUiyY70VB2lCjbQP2fcW3VSl/psqgiFlj+4+WYOQtGW6PvUDWDMuHRCBiE2CyF48tkEr+x0N2kNw5+d9foPjr+GCTOaUc1OCu18Dwov36kOokdvTIyL5oW5BYup18un5Nj9wwVfzzNSLXNLtSwDiNnTx4r5OeXF2K5UfQNX6RqqZ1uZ5poLT81BthoU+kFK8vYoH2Umj6zcq+Sq6AVfbpKIHVX5EgO9hGRJ9aec/Veq/ZlBRNjYZ18PmuA0HJ0KuBuGbrNuQrnDRQbVyTzmRpZ87zXptsN76iLvIE1SqjyjC5K11XIdR1theaIv87no5o03y7XIRJ01AKitZLUvNjoFB23eus+X012oTjkJB/pMtqIM4IZjYspxU/HS9x0GgsQ2SILjSYkcwmExXUrSeqMMweXueqts78Q+NX737VoqVy7ernN7N/VAE9+EKyPCy+S8RxuqmPS3ewCuRfTAGyUDeswgX7T+U1n+yQCCHuRsXtDWEDXJpuOW/Ll9jxebFVKPNWjAcPJIc5s6Q/roElQqXtlgcMPuQbji+hhT+6phbo3ghyBKXcVW65sysGrqC4bJCxWGVNUS1FKezawY1Hgc6K/yTWsj1BV1Or2JOqABmsZwBQ8Vrew==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(66476007)(2906002)(33656002)(86362001)(52536014)(64756008)(66446008)(66556008)(186003)(5660300002)(26005)(316002)(122000001)(38100700002)(76116006)(83380400001)(38070700005)(4326008)(6506007)(53546011)(55016003)(508600001)(9686003)(8676002)(7696005)(110136005)(8936002)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXRPZ1pWdjhReDE1YWxOYVBKOU56TW9ZTXorQlNIQ2JMQWtiQVdGSTNJejAw?=
 =?utf-8?B?b0pPUW8zMGUvVVpNZ21rTHdaZ0RqVTByVGp5Q0dmajJxUUIySVNaZHpJOWlE?=
 =?utf-8?B?RTJzRWNzdURDdC9xbmNmMStQcjI5aVN2aVhEOFhkZndjKzZ2QmgxZmJyOUQ0?=
 =?utf-8?B?YlkzQmVuSVFNR2hnZ1FuWUhxUVdnNTBBNXNGY1BvTkN5dUhXWExZSjJDc0N5?=
 =?utf-8?B?SzBsNFRkdVBxV0o1TUk3L1IyTnVYb0RpZ0hqL3JLbzJOYVIxYnIwL1ZMV0RB?=
 =?utf-8?B?akd0L1krZWdHQlhyaDM4S2E2dkZ0MFozVUhONGNyTDUyYjFDS2NTdmFtcjhT?=
 =?utf-8?B?ejFoRlpnSGw5ci9MRVAzUFNHcmV5bjVkN0thZXhZR2NJd3BRa1p5azB1WjZW?=
 =?utf-8?B?RU92SEdGV1FkRlNxLzJaa2UvUEFOdjY5dEt5aXhsalZjU0I0NUkzWVk2b3JD?=
 =?utf-8?B?M0FqZjdUY0NmY3AvK2t3TVR3SkovRVZROTZHUk4rSmJlOS9pVFNnZjNRT2Ir?=
 =?utf-8?B?RWUzRHZWSityZkhjNWdXclhQbmtxTnU3RlBpV0lZM2JVNnAwYnY3WFVYWWtU?=
 =?utf-8?B?aHd2NzB2SWpmb3JXQWJLYkJqN3RrYkpmcDFYY2VpRmFoVEdjeDRCWHB6akdj?=
 =?utf-8?B?Y1ZhV2lHSkNldVF5b3ZRcmhLQ2s4akFQcG1EakJSbU90d1VwYjB2ZkFLeHdR?=
 =?utf-8?B?TXJBeHhkOTdsallodHdCSVJIcHdsaEF0QWczS3Y0Mm1tZGpFT1l5NzlQVGdM?=
 =?utf-8?B?MkVtaEN5K0wwMFZ0OVQrVTFpWVZWU3U1NnlPQXRTSSszVVhPYWtmNlVacGJL?=
 =?utf-8?B?OWpSbzNJZ2g4bzBBZlNQWVJRc3ViUFdYMTJWWHZuaGVUMUpnZzBER0dBb2o1?=
 =?utf-8?B?dWdJaGdxWEtUUkdWL3pxWllzUmhOSzk0dG9lajNkVXdIWHRTZ2lJQzVjTFBT?=
 =?utf-8?B?QUJEVnZKQ0xPMzRENVhiVDFUc3R4ZGRNTWJHcG8wcmtTSm5uckJ0a2hLTkF1?=
 =?utf-8?B?Tzc1MGNxQ2lNS3hHZmZadUpxeW1iOTBaRkZSWExHMTVaazJYWUxHaFgycVJK?=
 =?utf-8?B?MTBrdEtwdXQ5NGM1RDExRnZBOXJuQXZUQmJJSnVIekxsbHdnME1QMURuN1da?=
 =?utf-8?B?d3I2U3lxYUJFbG5EbWQ1S1NyWXNXaXhyK1hmTDJmd2ltUXhxZEtLVy95VmtV?=
 =?utf-8?B?aW9sZmN1MUFycjNjK3JwN1RTOFVGUENWelRGdDJGMHk4ell5bk5uN2k1K2s4?=
 =?utf-8?B?bmVSZ29VVk1sdDQ2K0tkQ0RVRVJaKzBzdnF1RW51SlNnWXZJaEkxUml6dWVq?=
 =?utf-8?B?NHJFanZRc2M5YThuOUt6eEphRG04dzg1ejhLaGswOC95Yk1FNEtDdlYrNXdJ?=
 =?utf-8?B?QWNwdmdaaW1qaVhzMitSU08yMEFOa2ltYVdWR1hNZnRERW1kL0NJVDc2RUtY?=
 =?utf-8?B?WHkxYTd5Q2Q3czdGVXhkWkwreFJoTFRQZGZNVUlDeGczS0gzODQ0QUNTT0Y5?=
 =?utf-8?B?azVxaFZiRkg3cEFBS2dFMXJvMHNzQ3pWT3lqVGt1U2E4QS9jTDBKZG1Yb1dB?=
 =?utf-8?B?STQ1clBrUnRTbUlnUXpkaEpwUlAzQ1dCLzl4bG9ucmlpYm1ZRjN3OGQzVkpt?=
 =?utf-8?B?TkNqUk9pNDM4TDB6dDI5TlVwWmg5MExQdi9MRjB6bnAraUlPNDQrOUZRaDZz?=
 =?utf-8?B?bTBybzNGZE5uUHFSQUVBUmhCTXM4Z1lzeHdMVzdsa05aaEpoSXNRWjFSazBQ?=
 =?utf-8?B?ZEZQdVFpc0FNL0JQVHkrNEpmMEVaTGZ0RVZPMEkzN3J1clBLNmtHQjY2Y3Mz?=
 =?utf-8?B?ZGRkMk1tQ1dVd01pb2pjNEhOQWxUUmZRRzFubDc5NTZnSUJtSUx0N1VpdWtv?=
 =?utf-8?B?cFY4ZDRHRkcrTEgzeTM4c3VYa0pSYngxeXIza1lPeC9SenlJdUxUb2dGanJn?=
 =?utf-8?B?MVdPSC8yRlpLSDBKVnpXaWJ2T0xvS0l4dFNzb3cydHZ4SHdHK1JjWXpVMUU5?=
 =?utf-8?B?ZEhlZFlpTHlPMFhRa3JUc2x4K0lFKzVicDBnUStHZW1TN0JWLzJjZ04reVZK?=
 =?utf-8?B?ZHFDSHRNcVlUT0MvNThrcytocjVqNnNqMjBqTEdia1F1MlVJdnpSYld4ODJs?=
 =?utf-8?Q?b4ms=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df87e070-c07a-42ff-1521-08d9d4aaabe7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2022 02:32:54.2275 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /kZ4PcuhWzA8RA9JbWEK8CEj8WSfQ+QA6SwkwFk54bqryQUvtPPSSiXcvKQ0DkR9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB4677
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gRnJvbTogTGF6YXIsIExpam8gPExpam8uTGF6YXJAYW1kLmNvbT4NCj4gU2VudDogTW9u
ZGF5LCBKYW51YXJ5IDEwLCAyMDIyIDQ6MzEgUE0NCj4gVG86IFF1YW4sIEV2YW4gPEV2YW4uUXVh
bkBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IERldWNoZXIs
IEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQ
QVRDSF0gZHJtL2FtZC9wbTogY29ycmVjdCB0aGUgY2hlY2tzIGZvciBmYW4gYXR0cmlidXRlcw0K
PiBzdXBwb3J0DQo+IA0KPiANCj4gDQo+IE9uIDEvMTAvMjAyMiAxOjI1IFBNLCBRdWFuLCBFdmFu
IHdyb3RlOg0KPiA+IFtBTUQgT2ZmaWNpYWwgVXNlIE9ubHldDQo+ID4NCj4gPg0KPiA+DQo+ID4+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IExhemFyLCBMaWpvIDxMaWpv
LkxhemFyQGFtZC5jb20+DQo+ID4+IFNlbnQ6IE1vbmRheSwgSmFudWFyeSAxMCwgMjAyMiAzOjM2
IFBNDQo+ID4+IFRvOiBRdWFuLCBFdmFuIDxFdmFuLlF1YW5AYW1kLmNvbT47IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4+IENjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRl
ci5EZXVjaGVyQGFtZC5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9hbWQvcG06
IGNvcnJlY3QgdGhlIGNoZWNrcyBmb3IgZmFuDQo+ID4+IGF0dHJpYnV0ZXMgc3VwcG9ydA0KPiA+
Pg0KPiA+Pg0KPiA+Pg0KPiA+PiBPbiAxLzEwLzIwMjIgMTE6MzAgQU0sIEV2YW4gUXVhbiB3cm90
ZToNCj4gPj4+IEJlZm9yZSB3ZSByZWxpZWQgb24gdGhlIHJldHVybiB2YWx1ZXMgZnJvbSB0aGUg
Y29ycmVzcG9uZGluZyBpbnRlcmZhY2VzLg0KPiA+Pj4gVGhhdCBpcyB3aXRoIGxvdyBlZmZpY2ll
bmN5LiBBbmQgdGhlIHdyb25nIGludGVybWVkaWF0ZSB2YXJpYWJsZQ0KPiA+Pj4gdXNlZCBtYWtl
cyB0aGUgZmFuIG1vZGUgc3R1Y2sgYXQgbWFudWFsIG1vZGUgd2hpY2ggdGhlbiBjYXVzZXMNCj4g
Pj4+IG92ZXJoZWF0aW5nDQo+ID4+IGluDQo+ID4+PiAzRCBncmFwaGljcyB0ZXN0cy4NCj4gPj4+
DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPg0KPiA+
Pj4gQ2hhbmdlLUlkOiBJYTkzY2NmM2I5MjljMTJlNmQxMGI1MGM4ZjM1OTY3ODNhYzYzZjBlMw0K
PiA+Pj4gLS0tDQo+ID4+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2FtZGdwdV9kcG0uYyAg
ICAgfCAyMw0KPiA+PiArKysrKysrKysrKysrKysrKysrKysrKw0KPiA+Pj4gICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9wbS9hbWRncHVfcG0uYyAgICAgIHwgMjAgKysrKysrKysrKy0tLS0tLS0tLS0N
Cj4gPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vaW5jL2FtZGdwdV9kcG0uaCB8IDEyICsr
KysrKysrKysrKw0KPiA+Pj4gICAgMyBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCAx
MCBkZWxldGlvbnMoLSkNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wbS9hbWRncHVfZHBtLmMNCj4gPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2FtZGdw
dV9kcG0uYw0KPiA+Pj4gaW5kZXggNjhkMmU4MGE2NzNiLi5lNzMyNDE4YTk1NTggMTAwNjQ0DQo+
ID4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2FtZGdwdV9kcG0uYw0KPiA+Pj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9hbWRncHVfZHBtLmMNCj4gPj4+IEBAIC0xNTQ3LDMg
KzE1NDcsMjYgQEAgaW50DQo+IGFtZGdwdV9kcG1fZ2V0X2RwbV9jbG9ja190YWJsZShzdHJ1Y3QN
Cj4gPj4gYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gPj4+DQo+ID4+PiAgICAJcmV0dXJuIHJldDsN
Cj4gPj4+ICAgIH0NCj4gPj4+ICsNCj4gPj4+ICtpbnQgYW1kZ3B1X2RwbV9pc19mYW5fb3BlcmF0
aW9uX3N1cHBvcnRlZChzdHJ1Y3QgYW1kZ3B1X2RldmljZQ0KPiA+PiAqYWRldiwNCj4gPj4+ICsJ
CQkJCSAgZW51bSBmYW5fb3BlcmF0aW9uX2lkIGlkKQ0KPiA+Pj4gK3sNCj4gPj4+ICsJY29uc3Qg
c3RydWN0IGFtZF9wbV9mdW5jcyAqcHBfZnVuY3MgPSBhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3M7
DQo+ID4+PiArDQo+ID4+PiArCXN3aXRjaCAoaWQpIHsNCj4gPj4+ICsJY2FzZSBGQU5fQ09OVFJP
TF9NT0RFX1JFVFJJRVZJTkc6DQo+ID4+PiArCQlyZXR1cm4gcHBfZnVuY3MtPmdldF9mYW5fY29u
dHJvbF9tb2RlID8gMSA6IDA7DQo+ID4+PiArCWNhc2UgRkFOX0NPTlRST0xfTU9ERV9TRVRUSU5H
Og0KPiA+Pj4gKwkJcmV0dXJuIHBwX2Z1bmNzLT5zZXRfZmFuX2NvbnRyb2xfbW9kZSA/IDEgOiAw
Ow0KPiA+Pj4gKwljYXNlIEZBTl9TUEVFRF9QV01fUkVUUklFVklORzoNCj4gPj4+ICsJCXJldHVy
biBwcF9mdW5jcy0+Z2V0X2Zhbl9zcGVlZF9wd20gPyAxIDogMDsNCj4gPj4+ICsJY2FzZSBGQU5f
U1BFRURfUFdNX1NFVFRJTkc6DQo+ID4+PiArCQlyZXR1cm4gcHBfZnVuY3MtPnNldF9mYW5fc3Bl
ZWRfcHdtID8gMSA6IDA7DQo+ID4+PiArCWNhc2UgRkFOX1NQRUVEX1JQTV9SRVRSSUVWSU5HOg0K
PiA+Pj4gKwkJcmV0dXJuIHBwX2Z1bmNzLT5nZXRfZmFuX3NwZWVkX3JwbSA/IDEgOiAwOw0KPiA+
Pj4gKwljYXNlIEZBTl9TUEVFRF9SUE1fU0VUVElORzoNCj4gPj4+ICsJCXJldHVybiBwcF9mdW5j
cy0+c2V0X2Zhbl9zcGVlZF9ycG0gPyAxIDogMDsNCj4gPj4+ICsJZGVmYXVsdDoNCj4gPj4+ICsJ
CXJldHVybiAwOw0KPiA+Pj4gKwl9DQo+ID4+PiArfQ0KPiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG0vYW1kZ3B1X3BtLmMNCj4gPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3BtL2FtZGdwdV9wbS5jDQo+ID4+PiBpbmRleCBkM2VhYjI0NWUwZmUuLjU3NzIxNzUwYzUxYSAx
MDA2NDQNCj4gPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vYW1kZ3B1X3BtLmMNCj4g
Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vYW1kZ3B1X3BtLmMNCj4gPj4+IEBAIC0z
MjYzLDE1ICszMjYzLDE1IEBAIHN0YXRpYyB1bW9kZV90DQo+ID4+IGh3bW9uX2F0dHJpYnV0ZXNf
dmlzaWJsZShzdHJ1Y3Qga29iamVjdCAqa29iaiwNCj4gPj4+ICAgIAkJcmV0dXJuIDA7DQo+ID4+
Pg0KPiA+Pj4gICAgCS8qIG1hc2sgZmFuIGF0dHJpYnV0ZXMgaWYgd2UgaGF2ZSBubyBiaW5kaW5n
cyBmb3IgdGhpcyBhc2ljIHRvDQo+ID4+PiBleHBvc2UNCj4gPj4gKi8NCj4gPj4+IC0JaWYgKCgo
YW1kZ3B1X2RwbV9nZXRfZmFuX3NwZWVkX3B3bShhZGV2LCAmc3BlZWQpID09IC1FSU5WQUwpDQo+
ID4+ICYmDQo+ID4+PiArCWlmICgoIWFtZGdwdV9kcG1faXNfZmFuX29wZXJhdGlvbl9zdXBwb3J0
ZWQoYWRldiwNCj4gPj4gRkFOX1NQRUVEX1BXTV9SRVRSSUVWSU5HKSAmJg0KPiA+Pg0KPiA+PiBB
cyBwZXIgdGhlIGN1cnJlbnQgbG9naWMsIGl0J3MgcmVhbGx5IGNoZWNraW5nIHRoZSBoYXJkd2Fy
ZSByZWdpc3RlcnMuDQo+ID4gW1F1YW4sIEV2YW5dIEkgcHJvYmFibHkgc2hvdWxkIG1lbnRpb24g
dGhlICJjdXJyZW50IiB2ZXJzaW9uIHlvdSBzZWUgbm93DQo+IGlzIGFjdHVhbGx5IGEgcmVncmVz
c2lvbiBpbnRyb2R1Y2VkIGJ5IHRoZSBjb21taXQgYmVsb3c6DQo+ID4gODAxNzcxZGUwMzMxIGRy
bS9hbWQvcG06IGRvIG5vdCBleHBvc2UgcG93ZXIgaW1wbGVtZW50YXRpb24gZGV0YWlscw0KPiB0
bw0KPiA+IGFtZGdwdV9wbS5jDQo+ID4NCj4gPiBUaGUgdmVyeSBlYXJseSB2ZXJzaW9uKHdoaWNo
IHdvcmtzIGdvb2QpIGlzIHNvbWV0aGluZyBsaWtlIGJlbG93Og0KPiA+IC0gICAgICAgaWYgKCFp
c19zdXBwb3J0X3N3X3NtdShhZGV2KSkgew0KPiA+IC0gICAgICAgICAgICAgICAvKiBtYXNrIGZh
biBhdHRyaWJ1dGVzIGlmIHdlIGhhdmUgbm8gYmluZGluZ3MgZm9yIHRoaXMgYXNpYyB0byBleHBv
c2UNCj4gKi8NCj4gPiAtICAgICAgICAgICAgICAgaWYgKCghYWRldi0+cG93ZXJwbGF5LnBwX2Z1
bmNzLT5nZXRfZmFuX3NwZWVkX3B3bSAmJg0KPiA+IC0gICAgICAgICAgICAgICAgICAgIGF0dHIg
PT0gJnNlbnNvcl9kZXZfYXR0cl9wd20xLmRldl9hdHRyLmF0dHIpIHx8IC8qIGNhbid0DQo+IHF1
ZXJ5IGZhbiAqLw0KPiA+IC0gICAgICAgICAgICAgICAgICAgKCFhZGV2LT5wb3dlcnBsYXkucHBf
ZnVuY3MtPmdldF9mYW5fY29udHJvbF9tb2RlICYmDQo+ID4gLSAgICAgICAgICAgICAgICAgICAg
YXR0ciA9PSAmc2Vuc29yX2Rldl9hdHRyX3B3bTFfZW5hYmxlLmRldl9hdHRyLmF0dHIpKSAvKiBj
YW4ndA0KPiBxdWVyeSBzdGF0ZSAqLw0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGVmZmVj
dGl2ZV9tb2RlICY9IH5TX0lSVUdPOw0KPiA+DQo+ID4gU28sIHRoZSBjaGFuZ2VzIGhlcmUgYXJl
IHJlYWxseSBqdXN0IGJhY2sgdG8gb2xkIHdvcmtpbmcgdmVyc2lvbi4gSXQgYWltcyB0bw0KPiBw
cm92aWRlIGEgcXVpY2sgZml4IGZvciB0aGUgZmFpbHVyZXMgcmVwb3J0ZWQgYnkgQ1FFLg0KPiAN
Cj4gSSBzZWUuIENvdWxkIHlvdSBtb2RlbCBvbiBpdCBiYXNlZCBvbiBiZWxvdyBvbmU/IFRoaXMg
aXMgcHJlZmVycmFibGUgcmF0aGVyDQo+IHRoYW4gaW50cm9kdWNpbmcgbmV3IEFQSS4NCj4gDQo+
IGRybS9hbWRncHUvcG06IERvbid0IHNob3cgcHBfcG93ZXJfcHJvZmlsZV9tb2RlIGZvciB1bnN1
cHBvcnRlZA0KPiBkZXZpY2VzLg0KW1F1YW4sIEV2YW5dIEluIGZhY3QsIHRob3NlIHBpZWNlIG9m
IGNvZGUgZnJvbSB0aGUgbWVudGlvbmVkIGNoYW5nZSB3YXMgdXBkYXRlZCBhcyBiZWxvdw0KICAg
ICAgICB9IGVsc2UgaWYgKERFVklDRV9BVFRSX0lTKHBwX3Bvd2VyX3Byb2ZpbGVfbW9kZSkpIHsN
CiAgICAgICAgICAgICAgICBpZiAoYW1kZ3B1X2RwbV9nZXRfcG93ZXJfcHJvZmlsZV9tb2RlKGFk
ZXYsIE5VTEwpID09IC1FT1BOT1RTVVBQKQ0KICAgICAgICAgICAgICAgICAgICAgICAgKnN0YXRl
cyA9IEFUVFJfU1RBVEVfVU5TVVBQT1JURUQ7DQogICAgICAgIH0NCkFzIHRoZSBhY2Nlc3MgZm9y
IGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcyBmcm9tIGFtZGdwdV9wbS5jIHdhcyBmb3JiaWRkZW4g
YWZ0ZXIgdGhlIHBtIGNsZWFudXBzLg0KU28sIHdlIGhhdmUgdG8gcmVseSBvbiBzb21lIChuZXcp
QVBJIGluIGFtZGdwdV9kcG0uYyB0byBkbyB0aG9zZSBjaGVja3MuDQoNCkEgbW9yZSBwcm9wZXIg
d2F5IHRvIGNsZWFudXAgYWxsIHRob3NlIGF0dHJpYnV0ZXMgc3VwcG9ydCBjaGVja3Mgc3R1ZmYg
aXMgdG8gaGF2ZSBhIGZsYWcgbGlrZSAiYWRldi0+cG0uc3lzZnNfYXR0cmlidHVlc19mbGFncyIu
DQpJdCBsYWJlbHMgYWxsIHRob3NlIHN5c2ZzIGF0dHJpYnV0ZXMgc3VwcG9ydGVkIG9uIGVhY2gg
QVNJQy4gSG93ZXZlciwgY29uc2lkZXJpbmcgdGhlIEFTSUNzIGludm9sdmVkIGFuZCB0aGUgZGlm
ZmVyZW5jZSBiZXR3ZWVuIHRoZW0sIHRoYXQgbWF5IGJlIG5vdCBhbiBlYXN5IGpvYi4NCg0KQlIN
CkV2YW4NCj4gDQo+IFRoYW5rcywNCj4gTGlqbw0KPiANCj4gPj4gRm9yIGV4OiB3ZSBjb3VsZCBo
YXZlIHNvbWUgU0tVcyB0aGF0IGhhdmUgUE1GVyBiYXNlZCBmYW4gY29udHJvbCBhbmQNCj4gPj4g
Zm9yIHNvbWUgb3RoZXIgU0tVcywgQUlCcyBjb3VsZCBiZSBoYXZpbmcgYSBkaWZmZXJlbnQgY29v
bGluZw0KPiA+PiBzb2x1dGlvbiB3aGljaCBkb2Vzbid0IG1ha2UgdXNlIG9mIFBNRlcuDQo+ID4+
DQo+ID4+DQo+ID4+PiAgICAJICAgICAgYXR0ciA9PSAmc2Vuc29yX2Rldl9hdHRyX3B3bTEuZGV2
X2F0dHIuYXR0cikgfHwgLyogY2FuJ3QNCj4gPj4+IHF1ZXJ5DQo+ID4+IGZhbiAqLw0KPiA+Pj4g
LQkgICAgKChhbWRncHVfZHBtX2dldF9mYW5fY29udHJvbF9tb2RlKGFkZXYsICZzcGVlZCkgPT0g
LQ0KPiA+PiBFT1BOT1RTVVBQKSAmJg0KPiA+Pj4gKwkgICAgKCFhbWRncHVfZHBtX2lzX2Zhbl9v
cGVyYXRpb25fc3VwcG9ydGVkKGFkZXYsDQo+ID4+IEZBTl9DT05UUk9MX01PREVfUkVUUklFVklO
RykgJiYNCj4gPj4+ICAgIAkgICAgIGF0dHIgPT0gJnNlbnNvcl9kZXZfYXR0cl9wd20xX2VuYWJs
ZS5kZXZfYXR0ci5hdHRyKSkgLyoNCj4gPj4+IGNhbid0DQo+ID4+IHF1ZXJ5IHN0YXRlICovDQo+
ID4+PiAgICAJCWVmZmVjdGl2ZV9tb2RlICY9IH5TX0lSVUdPOw0KPiA+Pj4NCj4gPj4+IC0JaWYg
KCgoYW1kZ3B1X2RwbV9zZXRfZmFuX3NwZWVkX3B3bShhZGV2LCBzcGVlZCkgPT0gLUVJTlZBTCkN
Cj4gPj4gJiYNCj4gPj4+ICsJaWYgKCghYW1kZ3B1X2RwbV9pc19mYW5fb3BlcmF0aW9uX3N1cHBv
cnRlZChhZGV2LA0KPiA+PiBGQU5fU1BFRURfUFdNX1NFVFRJTkcpICYmDQo+ID4+PiAgICAJICAg
ICAgYXR0ciA9PSAmc2Vuc29yX2Rldl9hdHRyX3B3bTEuZGV2X2F0dHIuYXR0cikgfHwgLyogY2Fu
J3QNCj4gPj4gbWFuYWdlIGZhbiAqLw0KPiA+Pj4gLQkgICAgICAoKGFtZGdwdV9kcG1fc2V0X2Zh
bl9jb250cm9sX21vZGUoYWRldiwgc3BlZWQpID09IC0NCj4gPj4gRU9QTk9UU1VQUCkgJiYNCj4g
Pj4+ICsJICAgICghYW1kZ3B1X2RwbV9pc19mYW5fb3BlcmF0aW9uX3N1cHBvcnRlZChhZGV2LA0K
PiA+PiBGQU5fQ09OVFJPTF9NT0RFX1NFVFRJTkcpICYmDQo+ID4+PiAgICAJICAgICAgYXR0ciA9
PSAmc2Vuc29yX2Rldl9hdHRyX3B3bTFfZW5hYmxlLmRldl9hdHRyLmF0dHIpKSAvKg0KPiA+Pj4g
Y2FuJ3QNCj4gPj4gbWFuYWdlIHN0YXRlICovDQo+ID4+PiAgICAJCWVmZmVjdGl2ZV9tb2RlICY9
IH5TX0lXVVNSOw0KPiA+Pj4NCj4gPj4+IEBAIC0zMjkxLDE2ICszMjkxLDE2IEBAIHN0YXRpYyB1
bW9kZV90DQo+ID4+IGh3bW9uX2F0dHJpYnV0ZXNfdmlzaWJsZShzdHJ1Y3Qga29iamVjdCAqa29i
aiwNCj4gPj4+ICAgIAkJcmV0dXJuIDA7DQo+ID4+Pg0KPiA+Pj4gICAgCS8qIGhpZGUgbWF4L21p
biB2YWx1ZXMgaWYgd2UgY2FuJ3QgYm90aCBxdWVyeSBhbmQgbWFuYWdlIHRoZSBmYW4gKi8NCj4g
Pj4+IC0JaWYgKCgoYW1kZ3B1X2RwbV9zZXRfZmFuX3NwZWVkX3B3bShhZGV2LCBzcGVlZCkgPT0g
LUVJTlZBTCkNCj4gPj4gJiYNCj4gPj4+IC0JICAgICAgKGFtZGdwdV9kcG1fZ2V0X2Zhbl9zcGVl
ZF9wd20oYWRldiwgJnNwZWVkKSA9PSAtRUlOVkFMKQ0KPiA+PiAmJg0KPiA+Pj4gLQkgICAgICAo
YW1kZ3B1X2RwbV9zZXRfZmFuX3NwZWVkX3JwbShhZGV2LCBzcGVlZCkgPT0gLUVJTlZBTCkNCj4g
Pj4gJiYNCj4gPj4+IC0JICAgICAgKGFtZGdwdV9kcG1fZ2V0X2Zhbl9zcGVlZF9ycG0oYWRldiwg
JnNwZWVkKSA9PSAtRUlOVkFMKSkNCj4gPj4gJiYNCj4gPj4+ICsJaWYgKCghYW1kZ3B1X2RwbV9p
c19mYW5fb3BlcmF0aW9uX3N1cHBvcnRlZChhZGV2LA0KPiA+PiBGQU5fU1BFRURfUFdNX1NFVFRJ
TkcpICYmDQo+ID4+PiArCSAgICAgIWFtZGdwdV9kcG1faXNfZmFuX29wZXJhdGlvbl9zdXBwb3J0
ZWQoYWRldiwNCj4gPj4gRkFOX1NQRUVEX1BXTV9SRVRSSUVWSU5HKSAmJg0KPiA+Pj4gKwkgICAg
ICFhbWRncHVfZHBtX2lzX2Zhbl9vcGVyYXRpb25fc3VwcG9ydGVkKGFkZXYsDQo+ID4+IEZBTl9T
UEVFRF9SUE1fU0VUVElORykgJiYNCj4gPj4+ICsJICAgICAhYW1kZ3B1X2RwbV9pc19mYW5fb3Bl
cmF0aW9uX3N1cHBvcnRlZChhZGV2LA0KPiA+PiBGQU5fU1BFRURfUlBNX1JFVFJJRVZJTkcpKSAm
Jg0KPiA+Pg0KPiA+PiBJZiB0aGlzIGlzIHRoZSBjYXNlLCBJIHRoaW5rIHdlIHNob3VsZCBzZXQg
cG0ubm9fZmFuIHNpbmNlIG5vdGhpbmcgaXMNCj4gPj4gcG9zc2libGUuDQo+ID4gW1F1YW4sIEV2
YW5dIFllcCwgSSBhZ3JlZSBhIG1vcmUgb3B0aW1pemVkIHZlcnNpb24gc2hvdWxkIGJlIHNvbWV0
aGluZw0KPiBsaWtlIHRoYXQuDQo+ID4gTGV0J3MgdGFrZSB0aGlzIGEgcXVpY2sgc29sdXRpb24g
YW5kIGRvIGZ1cnRoZXIgb3B0aW1pemF0aW9ucyBsYXRlci4NCj4gPg0KPiA+IEJSDQo+ID4gRXZh
bg0KPiA+Pg0KPiA+PiBUaGFua3MsDQo+ID4+IExpam8NCj4gPj4NCj4gPj4+ICAgIAkgICAgKGF0
dHIgPT0gJnNlbnNvcl9kZXZfYXR0cl9wd20xX21heC5kZXZfYXR0ci5hdHRyIHx8DQo+ID4+PiAg
ICAJICAgICBhdHRyID09ICZzZW5zb3JfZGV2X2F0dHJfcHdtMV9taW4uZGV2X2F0dHIuYXR0cikp
DQo+ID4+PiAgICAJCXJldHVybiAwOw0KPiA+Pj4NCj4gPj4+IC0JaWYgKChhbWRncHVfZHBtX3Nl
dF9mYW5fc3BlZWRfcnBtKGFkZXYsIHNwZWVkKSA9PSAtRUlOVkFMKQ0KPiA+PiAmJg0KPiA+Pj4g
LQkgICAgIChhbWRncHVfZHBtX2dldF9mYW5fc3BlZWRfcnBtKGFkZXYsICZzcGVlZCkgPT0gLUVJ
TlZBTCkNCj4gPj4gJiYNCj4gPj4+ICsJaWYgKCghYW1kZ3B1X2RwbV9pc19mYW5fb3BlcmF0aW9u
X3N1cHBvcnRlZChhZGV2LA0KPiA+PiBGQU5fU1BFRURfUlBNX1NFVFRJTkcpICYmDQo+ID4+PiAr
CSAgICAgIWFtZGdwdV9kcG1faXNfZmFuX29wZXJhdGlvbl9zdXBwb3J0ZWQoYWRldiwNCj4gPj4g
RkFOX1NQRUVEX1JQTV9SRVRSSUVWSU5HKSkgJiYNCj4gPj4+ICAgIAkgICAgIChhdHRyID09ICZz
ZW5zb3JfZGV2X2F0dHJfZmFuMV9tYXguZGV2X2F0dHIuYXR0ciB8fA0KPiA+Pj4gICAgCSAgICAg
YXR0ciA9PSAmc2Vuc29yX2Rldl9hdHRyX2ZhbjFfbWluLmRldl9hdHRyLmF0dHIpKQ0KPiA+Pj4g
ICAgCQlyZXR1cm4gMDsNCj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bt
L2luYy9hbWRncHVfZHBtLmgNCj4gPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2luYy9hbWRn
cHVfZHBtLmgNCj4gPj4+IGluZGV4IGJhODU3Y2E3NTM5Mi4uOWUxODE1MWEzYzQ2IDEwMDY0NA0K
PiA+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9pbmMvYW1kZ3B1X2RwbS5oDQo+ID4+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2luYy9hbWRncHVfZHBtLmgNCj4gPj4+IEBA
IC0zMzAsNiArMzMwLDE2IEBAIHN0cnVjdCBhbWRncHVfcG0gew0KPiA+Pj4gICAgCWJvb2wJCQlw
cF9mb3JjZV9zdGF0ZV9lbmFibGVkOw0KPiA+Pj4gICAgfTsNCj4gPj4+DQo+ID4+PiArZW51bSBm
YW5fb3BlcmF0aW9uX2lkDQo+ID4+PiArew0KPiA+Pj4gKwlGQU5fQ09OVFJPTF9NT0RFX1JFVFJJ
RVZJTkcgPSAwLA0KPiA+Pj4gKwlGQU5fQ09OVFJPTF9NT0RFX1NFVFRJTkcgICAgPSAxLA0KPiA+
Pj4gKwlGQU5fU1BFRURfUFdNX1JFVFJJRVZJTkcgICAgPSAyLA0KPiA+Pj4gKwlGQU5fU1BFRURf
UFdNX1NFVFRJTkcgICAgICAgPSAzLA0KPiA+Pj4gKwlGQU5fU1BFRURfUlBNX1JFVFJJRVZJTkcg
ICAgPSA0LA0KPiA+Pj4gKwlGQU5fU1BFRURfUlBNX1NFVFRJTkcgICAgICAgPSA1LA0KPiA+Pj4g
K307DQo+ID4+PiArDQo+ID4+PiAgICB1MzIgYW1kZ3B1X2RwbV9nZXRfdmJsYW5rX3RpbWUoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOw0KPiA+Pj4gICAgaW50IGFtZGdwdV9kcG1fcmVhZF9z
ZW5zb3Ioc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGVudW0NCj4gPj4gYW1kX3BwX3NlbnNv
cnMgc2Vuc29yLA0KPiA+Pj4gICAgCQkJICAgdm9pZCAqZGF0YSwgdWludDMyX3QgKnNpemUpOyBA
QCAtNTEwLDQgKzUyMCw2IEBADQo+IGVudW0NCj4gPj4+IHBwX3NtdV9zdGF0dXMNCj4gPj4gYW1k
Z3B1X2RwbV9nZXRfdWNsa19kcG1fc3RhdGVzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0K
PiA+Pj4gICAgCQkJCQkJICB1bnNpZ25lZCBpbnQgKm51bV9zdGF0ZXMpOw0KPiA+Pj4gICAgaW50
IGFtZGdwdV9kcG1fZ2V0X2RwbV9jbG9ja190YWJsZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwNCj4gPj4+ICAgIAkJCQkgICBzdHJ1Y3QgZHBtX2Nsb2NrcyAqY2xvY2tfdGFibGUpOw0KPiA+
Pj4gK2ludCBhbWRncHVfZHBtX2lzX2Zhbl9vcGVyYXRpb25fc3VwcG9ydGVkKHN0cnVjdCBhbWRn
cHVfZGV2aWNlDQo+ID4+ICphZGV2LA0KPiA+Pj4gKwkJCQkJICBlbnVtIGZhbl9vcGVyYXRpb25f
aWQgaWQpOw0KPiA+Pj4gICAgI2VuZGlmDQo+ID4+Pg0K
